import os
import sys
import re

dfa_start = "Bolcat AFD:"
dfa_state = re.compile("estat # ([0-9]+):")
dfa_transition = re.compile("[ \t]*([0-9]+)[ \t]+([0-9]+)")
meta_class = re.compile("[ ]*([^ \n]+|' ') = ([-0-9]+)")

dfa_final_state = re.compile("l'estat # ([0-9]+) accepta: \[([0-9]+)\]")

# 1. Assegurar-se que els arxius out.txt i inputs.txt tenen el format
#   adequat, és a dir, inputs.txt és l'array de cada caràcter amb la 
#   seva classe d'equivalència i l'arxiu out.txt conté les transcions
#   de l'AFD

# Determina si l'estat a és igual a l'estat b
def esIgual(a, b):
    iguals = True

    if len(a['transition']) != len(b['transition']):
        iguals = False
        return iguals

    if len(a['parents']) != len(b['parents']):
        iguals = False
        return iguals
    else:
        for x in a['parents']:
            if not x in b['parents']:
                iguals = False
                break
    
        if not iguals:
            return False

    for valor in a['transition']:
        if not valor in b['transition']:
            iguals = False
            break

        if a['transition'][valor] != b['transition'][valor]:
            iguals = False
            break


    return iguals

def _convertir(dfa_file, ec_file, output, initState = None):
    # Carrega l'arxiu d'entrada així com ho mostra el flex
    dfa = open(dfa_file)

    states = {}
    classes = {}

    # Trobar l'inici de la taula de transicions
    line = dfa.readline()
    while line:
        if dfa_start in line:
            dfa.readline()
            break
        
        line = dfa.readline()
    
    lastState = 0
    while line:

        if dfa_state.match(line):
            m = dfa_state.match(line)
            lastState = int( m.group(1) )
            print("S'ha trobat nou estat %d" % (lastState))

            if not lastState in states:
                states[lastState] = {
                    'final': False,
                    'accepta': 0,
                    'transition': {},
                    'outbound_edge': {},
                    'parents': []
                }
        elif dfa_transition.match(line):
            m = dfa_transition.match(line)
            if len(m.groups()) > 1:
                value = int(m.group(1))
                nextState = int(m.group(2))
                states[lastState]['transition'][value] = nextState

                if not nextState in states:
                    states[nextState] = {
                        'final': False,
                        'accepta': 0,
                        'transition': {},
                        'outbound_edge': {},
                        'parents': []
                    }

                if not nextState in states[nextState]['parents']:
                    states[nextState]['parents'].append(lastState)


                if not (nextState in states[lastState]['outbound_edge']):
                    states[lastState]['outbound_edge'][nextState] = []

                states[lastState]['outbound_edge'][nextState].append(value)
                

#                print("Transició de %d a %d amb %d" % (lastState, nextState, value))
        elif meta_class.match(line):
            m = meta_class.findall(line)
            for ma in m:
                charValue = ma[0]
                classValue = int(ma[1])

                if not classValue in classes:
                    classes[classValue] = [] 

#                print("Assignant " + charValue + " a " + str(classValue))

                classes[classValue].append(charValue)

        elif dfa_final_state.match(line):
            print(line)
            # linia de estat final
            m = dfa_final_state.match(line)

            estat = int(m.group(1))
            accepta = int(m.group(2))

            states[estat]['final'] = True
            states[estat]['accepta'] = accepta

        line = dfa.readline()
    

    print(classes)

    oberts = []
    tancats = []

    if initState != None:
        oberts.append(initState)
        while len(oberts):            
            tmp = oberts.pop()

            if not tmp in states:
                continue

            for x in states[tmp]['transition']:
                next = states[tmp]['transition'][x]
                if not ((next in oberts) or (next in tancats)):
                    oberts.append(next)

            tancats.append(tmp)

    # Representant amb .dot
    f = open(output, "w")
    f.write("digraph afd{")
    g = 0
    for x in states:

        if initState != None:
            if not x in tancats:
                continue

        skip = False
        """    t = 0
        for z in states:
            if t < g and esIgual(states[z], states[x]):
                print("L'estat " + str(x) + " és igual a " + str(z) + ". Ignorant.")
                skip = True
                break

            t+=1
        
        g +=1 """

        if skip:
#            continue
            pass

        if states[x]['final']:
            f.write(str(x) + "[shape=\"doublecircle\", label=\""+str(x)+" - ["+ str(states[x]['accepta']) +"]\"]")

        for d in states[x]['outbound_edge']:
            label = ""
            for char in states[x]['outbound_edge'][d]:
                if len(classes[char]) > 5:
                    label += "[" + str(char) + "]"
                    continue
                
                for i in classes[char]:
                    if i == "\"":
                        label += "\\\" "
                    else:
                        label += i + " "

            print(label)
            f.write(str(x) + " -> " + str(d) + " [label=\""+label+"\"]  \n")
    f.write("}")
    f.close()

if __name__ == "__main__":
    if len(sys.argv) < 4:
        print("python3 conversor <dfa file> <char array> <.dot output file> [estatInicial]")
        exit()

    inicial = None
    if len(sys.argv) == 5:
        inicial = int(sys.argv[4])

    _convertir(sys.argv[1], sys.argv[2], sys.argv[3], inicial)