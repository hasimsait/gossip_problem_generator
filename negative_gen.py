import sys


'''
Instances with negative goals: Bu tür instance'ları generate etmek kolay değil. Bir yöntem şöyle olabilir: 
az sayıda negative goal içeren ve çözümü olmayan bir problem instance S_0 bulup ("seed" gibi), 
    onun üstüne k tane yeni negative goals ekleyerek yeni bir instance S_1 oluşturmak,  
        onun üstüne k tane yeni negative goals ekleyerek yeni bir instance S_2 oluşturmak, ... 

Bu şekilde, farklı sayıda agents için, farklı birkaç seed instance'tan başlayarak yeni instance'lar üretebilirsiniz. 
Bu instance'lar, negativeGoals(S_i) \subset negativeGoals(S_{i+1}) olduğundan, 
şu sorunun deneysel olarak incelenmesinde faydalı olacaktır: how will computational performance will change if I add some more negative goals? 
'''

'''
1 negative goal per agent (n>=4):
1 calls 2,3,...,n-1
1 calls 2,3,...,n-3
n-2 calls n

2 negative goals per agent (n>=6):
1 calls [2,n-2]
1 calls [2,n-5]
n-3 calls n-4 *COPY THE "3 MISSING" as you'll need it twice (n-4!=1 therefore n must be greater than 6)
n calls n-3
n-1 calls n-4

3 ng/a (n>=8):
1 calls [2,n-3]
1 calls [2,n-7]
n-4 calls n-5 and n-6 *COPY THE "4 MISSING" twice as you'll need it three times
n calls n-4
n-1 calls n-5
n-2 calls n-6

4 ng/a (n>=10):
1 calls [2,n-4]
1 calls [2,n-9]
n-5 calls n-6, n-7 and n-8 *COPY
n calls n-5
n-1 calls n-6
n-2 calls n-7
n-3 calls n-8

5 ng/a (n>=12):
1 calls [2,n-5]
1 calls [2,n-11]
n-6 calls n-7, n-8, n-9 and n-10 *COPY
n calls n-6
n-1 calls n-7
n-2 calls n-8
n-3 calls n-9
n-4 calls n-10
...
This does not imply that for "n agents there can be x negative goals per agent.".

you must create x-1 copies of n-x-1 therefore n-2x=2 => n=2x+2
to achieve 50% means n=2x. Impossible this way.
45% => n*0.45=x => n=18
'''

FAST_DOWNWARD="/home/hasimsait/Downloads/fast-downward-20.06/fast-downward.py"
#you could do something like they have in the audacity pipes, I won't bother with it now.
#set it to your fast-downward executable's location.

