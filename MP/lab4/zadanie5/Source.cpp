#include <iostream>
#include <iomanip>
#include "LCS.h"
#include "LCH.h"
#include <ctime>

int main()
{
    setlocale(LC_ALL, "ru");
    clock_t t1 = 0, t2 = 0, t3 = 0, t4 = 0;
    char X[] = "ABCDFGI", Y[] = "EATUFI";
    std::cout << "-- ���������� ����������� -----" << std::endl;
    std::cout << std::endl << "-- ���������� ����� ��� X � Y";
    std::cout << std::endl << "-- ������������������ X: " << X;
    std::cout << std::endl << "-- ������������������ Y: " << Y;
    t1 = clock();
    int s = lcs(
        sizeof(X) - 1,  // �����   ������������������  X   
        "ABCDFGI",       // ������������������ X
        sizeof(Y) - 1,  // �����   ������������������  Y
        "EATUFI"       // ������������������ Y
    );
    t2 = clock();
    char z[100] = "";
    char x[] = "ABCDFGI", y[] = "EATUFI";
    t3 = clock();
    int l = lcsd(x, y, z);
    t4 = clock();
    std::cout << std::endl << "-- ����� LCS(��������): " << s << std::endl;
    std::cout << "-- ����� LCH(��): " << l << std::endl;
    std::cout << "-- LCS: " << (t2 - t1) << std::endl;
    std::cout << "-- LCH: " << (t4 - t3) << std::endl;
    system("pause");
    return 0;
}
