#ifndef _H_VALUE_CONTAINER
#define _H_VALUE_CONTAINER
class ValueContainer {
private:
	char *value = nullptr;
	unsigned int valueSize;

public:
	ValueContainer();
	ValueContainer(const char *value, unsigned int valueSize);
	~ValueContainer();

	char *get();
	void set(const char *value, unsigned int valueSize);
	unsigned int getSize();
	friend bool operator==(const ValueContainer &left, const ValueContainer &right);
};
#endif