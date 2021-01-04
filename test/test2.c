int a=20,g=30;

void fun(int *v){

}

int main() {

int b,c,d=50,e,f,h;
int *p,*q;

   b=a+2*g;
   
   if(b>20)
   	c=a;
   else
   	c=g;

   p = &d;
   e=c+30;

   f= *p+20;
   q=&e;
   fun(q);
   
  return 0;
}