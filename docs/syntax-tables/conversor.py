import sys
import xml.etree.ElementTree as ET

def _conversor(input, output, outputT2):
    root = ET.parse(input).getroot()
    automaton = root.find("automaton")

    terminals = []
    variables = []
    t1 = []
    t2 = []

    # obtenir els estats de l'autòmat
    states = automaton.findall("state")

    i = 0
    for s in states:
        fila = {}
        filat2 = {}

        t1.append(fila)
        t2.append(filat2)

        actions = s.find("actions")
        transitions = actions.find("transitions")
        reduction = actions.find("reductions")

        for t in transitions:
            # t és una transicio
            tipus = t.get("type")
            simbol = t.get("symbol")

            if tipus == "shift":
                if not simbol in terminals:
                    terminals.append(simbol)

                fila[simbol] = { 'tipus': tipus, 'next': t.get("state") }
            elif tipus == "goto":
                if not simbol in variables:
                    variables.append(simbol)

                filat2[simbol] = { 'next': t.get("state") }


        for r in reduction:
            simbol = r.get("symbol")
            if not simbol in terminals:
                terminals.append(simbol)

            if simbol == "$default":
                # Obtenir els look-aheads d'aquesta producció
                items = s.findall("itemset/item")
                lookAhead = []
                for x in items:
                    if x.get("rule-number") == r.get("rule"):
                        lookAhead = x.findall("lookaheads/symbol")
                        break
                
                for x in lookAhead:
                    if not x.text in terminals:
                        terminals.append(x.text)
                    fila[x.text] = { 'tipus': 'reduction', 'next': r.get("rule") }
            else:
                fila[simbol] = { 'tipus': 'reduction', 'next': r.get("rule") }

        i += 1

    # Escriure al fitxer de sortida
    f = open(output, "w")
    f.write("<table border=1>")
    f.write("<thead><tr><th>Estat</th>")
        
    for i in terminals:
        f.write("<th>" + str(i) + "</th>")

    f.write("</tr></thead>")

    for i in range(0, len(t1)):
        row = t1[i]
        line = "<tr><td>" + str(i) + "</td>"
        for x in terminals:
            if x in row:
                if row[x]['tipus'] == "shift":
                    line += "<td>d_{"+str(row[x]['next'])+"}</td>"
                elif row[x]['tipus'] == "reduction":
                    line += "<td>r_{"+str(row[x]['next'])+"}</td>"
            else:
                line += "<td>-</td>"

        line += "</tr>"
        f.write(line)

    f.write("</table>")
    f.close()

    # Escriure al fitxer de sortida
    f = open(outputT2, "w")
    f.write("<table border=1>")
    f.write("<thead><tr><th>Estat</th>")
        
    for i in variables:
        f.write("<th>" + str(i) + "</th>")

    f.write("</tr></thead>")

    for i in range(0, len(t2)):
        row = t2[i]
        line = "<tr><td>" + str(i) + "</td>"
        for x in variables:
            if x in row:
                line += "<td>"+str(row[x]['next'])+"</td>"
            else:
                line += "<td>-</td>"

        line += "</tr>"
        f.write(line)

    f.write("</table>")
    f.close()



if __name__ == "__main__":
    if len(sys.argv) < 4:
        print("python3 conversor.py <input.xml> <outputT1.html> <outputT2.html>")
    else:
        _conversor(sys.argv[1], sys.argv[2], sys.argv[3])
        