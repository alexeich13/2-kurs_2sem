#include <iostream>
#include <iomanip>
#include "Boat.h"
#include "Combi.h"
#include "stdafx.h"
#define NN (sizeof(v)/sizeof(int))
#define MM 5

namespace boatfnc
{
    int calcv(combi::xcombination s, const int v[])  // ���
    {
        int rc = 0;
        for (int i = 0; i < s.m; i++) rc += v[s.ntx(i)];
        return rc;
    };

    int calcc(combi::xcombination s, const int c[]) // ����� 
    {
        int rc = 0;
        for (int i = 0; i < s.m; i++) rc += c[s.ntx(i)];
        return rc;
    };

    void   copycomb(short m, short* r1, const short* r2) // ����������    
    {
        for (int i = 0; i < m; i++)  r1[i] = r2[i];
    };

}
int  boat(
    int V,         // [in]  ������������ ��� �����
    short m,       // [in]  ���������� ���� ��� �����������     
    short n,       // [in]  ����� �����������  
    const int v[], // [in]  ��� ������� ����������  
    const int c[], // [in]  ����� �� ��������� ������� ����������     
    short r[]      // [out] ���������: ������� ��������� �����������  
)
{
    combi::xcombination xc(n, m);
    int rc = 0, i = xc.getfirst(), cc = 0;
    while (i > 0)
    {
        if (boatfnc::calcv(xc, v) <= V)
            if ((cc = boatfnc::calcc(xc, c)) > rc)
            {
                rc = cc; boatfnc::copycomb(m, r, xc.sset);
            }
        i = xc.getnext();
    };
    return rc;
};
int main()
{
    setlocale(LC_ALL, "rus");
    int V = 1500,
        v[] = { 100,  200,   300,  400,  500,  150, 600, 250, 100, 150, 350, 400, 700, 650, 300, 750, 200, 800, 850, 400, 450, 300, 350, 100, 150 },
        c[NN] = { 10,   15,    20,   25,   30,  25, 40, 50, 70, 100, 90, 80, 60, 20, 45, 55, 70, 80, 40, 50, 35, 45, 70, 75, 60 };
    short  r[MM];
    int cc = boat(
        V,   // [in]  ������������ ��� �����
        MM,  // [in]  ���������� ���� ��� �����������     
        NN,  // [in]  ����� �����������  
        v,   // [in]  ��� ������� ����������  
        c,   // [in]  ����� �� ��������� ������� ����������     
        r    // [out] ���������: ������� ��������� �����������  
    );
    std::cout << std::endl << "- ������ � ���������� ����������� �� �����";
    std::cout << std::endl << "- ����� ���������� �����������    : " << NN;
    std::cout << std::endl << "- ���������� ���� ��� ����������� : " << MM;
    std::cout << std::endl << "- ����������� �� ���������� ����  : " << V;
    std::cout << std::endl << "- ��� �����������                 : ";
    for (int i = 0; i < NN; i++) std::cout << std::setw(3) << v[i] << " ";
    std::cout << std::endl << "- ����� �� ���������              : ";
    for (int i = 0; i < NN; i++) std::cout << std::setw(3) << c[i] << " ";
    std::cout << std::endl << "- ������� ���������� (0,1,...,m-1): ";
    for (int i = 0; i < MM; i++) std::cout << r[i] << " ";
    std::cout << std::endl << "- ����� �� ���������              : " << cc;
    std::cout << std::endl << "- ����� ��� ��������� ����������� : ";
    int s = 0; for (int i = 0; i < MM; i++) s += v[r[i]]; std::cout << s;
    std::cout << std::endl << std::endl;
    system("pause");
    return 0;
}
