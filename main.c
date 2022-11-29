#include <stdio.h>

void printTriangle(int height);

void printRectangle(int width, int height);

void printFormat(int endValue, int numColumns, int skipMultiple);

int main() {
    printFormat(30, 5, 4);
    printf("----------------------------------------------\n\n");
    printFormat(38, 6, 3);
    printf("----------------------------------------------\n\n");
    printFormat(1, 4, 10);
    printf("----------------------------------------------\n\n");
    printFormat(44, 0, 8);
    printf("----------------------------------------------\n\n");
    printFormat(40, -1, 5);
    printf("----------------------------------------------\n\n");
    printFormat(40, 5, 4);
    printf("----------------------------------------------\n\n");
    printFormat(41, 6, 2);
    printf("----------------------------------------------\n\n");
    printFormat(30, 5, 4);
    printf("----------------------------------------------\n\n");
    printFormat(39, 5, 2);
    printf("----------------------------------------------\n\n");
    printFormat(1, 7, 2);
    printf("----------------------------------------------\n\n");
    printFormat(30, 0, 5);
    printf("----------------------------------------------\n\n");
    printFormat(38, -1, 9);
    printf("----------------------------------------------\n\n");
    printFormat(40, 5, 4);
    printf("----------------------------------------------\n\n");
    printFormat(42, 2, 2);
    printf("----------------------------------------------\n\n");
    printFormat(34, 1, 5);
    printf("----------------------------------------------\n\n");
    printFormat(35, 7, -1);
    printf("----------------------------------------------\n\n");
    printFormat(40, 5, 4);
    printf("----------------------------------------------\n\n");


}

void printTriangle(int height) {
    if (height >= 1) {
        int counter = 0;
        int width = height;
        int plus = 1;
        int another_counter = 0;
        while (height > another_counter) {
            while (counter + 1 < width) {
                printf("D");
                counter += 1;
            }
            counter = 0;
            if (another_counter == 0 || another_counter == 1 || another_counter == height - 1) {
                while (counter < plus) {
                    printf("+");
                    counter += 1;
                }
            } else {
                while (counter < plus) {
                    if (counter == 0 || counter == plus - 1) {
                        printf("+");
                        counter += 1;
                    } else {
                        printf("-");
                        counter += 1;
                    }
                }
            }
            counter = 0;
            printf("\n");
            width -= 1;
            plus += 1;
            another_counter += 1;
        }
    }

}

void printRectangle(int width, int height) {
    if (width >= 1 && height >= 1) {
        int i;
        int j;
        for (i = 0; i < height; i++) {
            if (i == 0 || i == height - 1) {
                for (j = 0; j < width; j++) {
                    printf("+");
                }
                printf("\n");
            } else {
                for (j = 0; j < width; j++) {
                    if (j == 0 || j == width - 1) {
                        printf("+");
                    } else {
                        printf("-");
                    }
                }
                printf("\n");
            }
        }
    }
}

void printFormat(int endValue, int numColumns, int skipMultiple) {
    if (endValue >= 1) {
        int counter = 1;
        int column_checker = 1;
        while (counter <= endValue) {
            printf("%d", counter);
            counter += 1;
            if (skipMultiple > 1 && counter % skipMultiple == 0) {
                counter += 1;
            }
            if ((numColumns > 0 && column_checker % numColumns == 0) ||
                (counter == endValue + 1 || counter == endValue + 2) && numColumns != 0) {
                printf("X\n");
            } else if (counter != endValue + 1 && counter - 1 != endValue + 1 && counter - 2 != endValue + 1) {
                printf("------");
            }
            column_checker += 1;


        }
        if (numColumns == 0 || (counter != endValue + 1 && counter != endValue + 2)) {
            printf("x\n");
        }
    }
}
