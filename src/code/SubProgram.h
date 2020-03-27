#ifndef _H_SUBPROGRAM
#define _H_SUBPROGRAM

#include <string>

class SubProgram {
    private:
        int np;
        std::string id;
    public:
        SubProgram(int np, std::string id);
        ~SubProgram();

        void setNP(int np);

};

#endif