#include <cstdint>

extern "C"
{

struct ArrayWrapper {
    std::uint8_t numbers[6];
};

ArrayWrapper mutate(std::uint8_t i) {
    ArrayWrapper numbers = {1, i, 3, 4, 5, 6};
    for (int j = 0; auto& v: numbers.numbers) {
        v += j++;
    }
    return numbers;
}

}
