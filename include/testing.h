#ifndef TESTING_H
#define TESTING_H

/**
 * this kind of global variable uses only const to ensure constness. Can it be placed correctly here?
 */
const int var_with_const = 91;

/**
 * This second type uses the extern keyword. Can it be placed correctly here?
 */
extern int var_extern;

/**
 * This is a global variable defined with a value. Can it be placed correctly here?
 */
int testing_external = 42;

/**
 * This is a global variable with no value defined. Can it be placed correctly here?
 */
int testing_external_no_value;

/**
 * A dummy function here to ensure library compiling.
 */
void dummy_function(void);

#endif // TESTING_H
