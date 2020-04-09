#include <stdio.h>
#include <stdint.h>

struct ArrayWrapper {
    uint8_t numbers[6];
};

struct ArrayWrapper mutate(uint8_t i);

int main()
{
    struct ArrayWrapper x = mutate(1);
    printf("[%d, %d, %d, %d, %d, %d]\n", x.numbers[0], x.numbers[1],
            x.numbers[2], x.numbers[3], x.numbers[4], x.numbers[5]);

    struct ArrayWrapper y = mutate(100);
    printf("[%d, %d, %d, %d, %d, %d]\n", y.numbers[0], y.numbers[1],
            y.numbers[2], y.numbers[3], y.numbers[4], y.numbers[5]);

    return 0;
}
