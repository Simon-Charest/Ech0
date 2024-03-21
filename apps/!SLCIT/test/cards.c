#include <stdio.h>
#include <stdlib.h>
#include <time.h>

struct Card
{
    char rank[3];
    char suit[3];
};

int main()
{
    // Seed the random number generator
    srand(time(NULL));

    // Initialize the array with cards
    char ranks[][3] = {"2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"};
    char suits[][3] = {"S", "C", "H", "D"};

    int num_ranks = sizeof(ranks) / sizeof(ranks[0]);
    int num_suits = sizeof(suits) / sizeof(suits[0]);

    // Array of cards
    struct Card cards[num_ranks * num_suits];

    // Initialize the array with all possible cards
    int index = 0;

    for (int r = 0; r < num_ranks; r ++)
    {
        for (int s = 0; s < num_suits; s ++)
        {
            snprintf(cards[index].rank, sizeof(cards[index].rank), "%s", ranks[r]);
            snprintf(cards[index].suit, sizeof(cards[index].suit), "%s", suits[s]);
            index ++;
        }
    }

    int hand = 0;

    // Total number of cards
    int num_cards = num_ranks * num_suits;

    while (hand < 5 && num_cards > 0)
    {
        // Generate a random index within the bounds of the array
        int random_index = rand() % num_cards;

        // Print the rank and suit of the randomly selected card
        printf("%s%s\n", cards[random_index].rank, cards[random_index].suit);

        for (int c = random_index; c < num_cards - 1; c ++)
        {
            cards[c] = cards[c + 1];
        }

        hand ++;
        num_cards --;
    }

    return 0;
}
