    function guanya(tauler, dimensions, jugador){
        let victoria = true;

        // diagonal principal
        for(var i = 0; i < dimensions && victoria; i++){
            victoria = tauler[i][i] == jugador;
        }

        if(!victoria){
            victoria = true;
            for(var i = 0; i < dimensions && victoria; i++){
                victoria = tauler[i][dimensions - i - 1] == jugador;
            }
        }

        // alguna fila
        if(!victoria){
            for(var i = 0; i < dimensions && !victoria; i++){
                var tmpFila = true;
                for(var j = 0; j < dimensions && tmpFila; j++){
                    tmpFila = tauler[i][j] == jugador;
                }
                victoria = tmpFila;
            }
        }

        if(!victoria){
            for(var i = 0; i < dimensions && !victoria; i++){
                var tmpColumna = true;
                for(var j = 0; j < dimensions && tmpColumna; j++){
                    tmpColumna = tauler[j][i] == jugador;
                }
                victoria = tmpColumna;
            }
        }

        return victoria;
    }

    function taulerPle(tauler, dimensions){
        var ple = true;

        for(var i = 0; i < dimensions && ple; i++){
            for(var j = 0; j < dimensions && ple; j++){
                ple = tauler[i][j] != 0;
            }
        }

        return ple;
    }

    function resol(tauler, dimensions, jugador, torn, solucio, moviments){
        var oposat = torn == 1 ? 2 : 1;

        if(guanya(tauler, dimensions, torn)){
            return 10;
        }else if(guanya(tauler, dimensions, oposat)){
            return -10;
        }else if(taulerPle(tauler, dimensions)){
            return 0;
        }else{
            var best = -10000;

            for(var i = 0; i < dimensions; i++){
                for(var j = 0; j < dimensions; j++){
                    if(tauler[i][j] == 0){
                        var copia = JSON.parse(JSON.stringify(tauler));
                        var aux = [0, 0];
                        copia[i][j] = torn;
                        var tmp = -resol(copia, dimensions, jugador, oposat, aux, moviments + 1);

                        if(tmp > best){
                            best = tmp;
                            solucio[0] = i;
                            solucio[1] = j;
                        }
                    }
                }
            }

            return best;
        }
    } 

    var a = [0, 0]
    var tauler = [ [2, 1, 0], [0, 1, 0], [0, 0, 0] ];
    resol(tauler, 3, 2, 2, a, 0);