#if defined(_MSC_VER)
#  define NOMINMAX // workaround a bug in windows.h
#  include <windows.h>
#else
#  include <sys/time.h>
#endif

#include <iostream>
#include<cstdlib>
#include<ctime>
#define N 10


/**
 * Retorna o tempo em segundos.
 *
 * @return tempo em segundos.
 */
double tempo() {
    struct timeval tv;
    struct timezone tz;

    gettimeofday(&tv, &tz);
    return (tv.tv_sec + tv.tv_usec / 1000000.0);
}
//Declaração global
int x[N][N],y[N][N],z[N][N];

int main() {
    //inicializando variáveis

    srand((unsigned)time(0));
    for(int i =0 ;i < N; ++i)
    {  
	     for(int j=0; j< N; ++j)
             {  
		   x[i][j]=(rand()%5+1);
                   y[i][j]=(rand()%6+1);
             } 
    }
    //Pega o tempo antes da conta
    double tempoAntes=tempo();
    //Conta cabulosa
    for(int i =0; i < N; ++i)
	    for(int j = 0 ; j< N; ++j)
		    for(int k=0; k < N; ++k)
			    z[i][j]=z[i][j]+x[i][k]*y[k][j];

    // Pega o tempo depois da conta
    double tempoDepois = tempo();
    // Tempo decorrido eh a diferenca
    double tempoDecorrido = tempoDepois - tempoAntes;
    std::cout << tempoDecorrido << " segundos" << std::endl;
}
