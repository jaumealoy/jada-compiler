#ifndef _H_STRINGBUFFER
#define _H_STRINGBUFFER

#include <string>
using namespace std;

class StringBuffer{
private:
    string myString;

public:
    StringBuffer();
    ~StringBuffer();
    
    void append(char c);
    void append(string str);

    string getString();

    void clear();
};

#endif