#include <catch2/catch.hpp>

TEST_CASE("Simple Example multiply test", "[multiply]")
{
    REQUIRE(5 * 5 == 25);
}

TEST_CASE("Simple Example add test", "[add]")
{
    REQUIRE(5 + 5 == 10);
}
