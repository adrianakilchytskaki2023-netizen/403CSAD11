#include <gtest/gtest.h>
#include "../math_operations.h"

// Test case 'BasicAddition' verifies the correctness of the add function.
TEST(BasicAddition, Correctness) {
    EXPECT_EQ(add(0, 0), 0);
    EXPECT_EQ(add(1, 2), 3);
    EXPECT_EQ(add(-1, -2), -3);
    EXPECT_EQ(add(-5, 5), 0);
    EXPECT_EQ(add(1000000, 2000000), 3000000);
}