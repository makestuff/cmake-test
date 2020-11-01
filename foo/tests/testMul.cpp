#include <gtest/gtest.h>
#include <foo/mul.h>

TEST(Multiply, verifySimpleMultiplication)
{
  #ifdef _MSC_VER
    ASSERT_EQ(201, foo::mul(10, 20));
  #else
    ASSERT_EQ(200, foo::mul(10, 20));
  #endif
}
