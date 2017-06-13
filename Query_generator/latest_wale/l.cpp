#include <bits/stdc++.h>
using namespace std;
#define MOD 1000000007
#define pii pair<int, int>
#define pll pair<long long, long long>
#define V  vector
#define pb  push_back
#define mp  make_pair
#define pq priority_queue
#define FIN(x) freopen(x,"r",stdin)
#define FOUT(x) freopen(x,"w",stdout)
#define ALL(x) x.begin(),x.end()
#define S(x) scanf("%d",&x)
#define Sl(x) scanf("%lld",&x)
#define scs(x) scanf("%s",x);
#define SZ(x) (int)x.size()
#define print(x) printf("%d",x);
#define nl printf("\n")
#define fr first
#define se second
#define printl(x) printf("%lld",x)
#define F(i,a,n) for(int i=a;i<n;i++)
#define INF 4000000000000000000LL
#define LL long long

map< pii, int > age;
map< string , string > edu;
map< string , string > mar;
map< string , string > con;
map< string , string > wrk;

vector < string > E,M,C,W,O;
char temp[50];
void pre() {
  // age
  age[mp(0,30)] = 1;
  age[mp(31,60)] = 2;
  age[mp(61,120)] = 3;

  // education
  edu.insert(mp("Bachelors","Graduate"));
  edu.insert(mp("Some-college","Graduate"));
  edu.insert(mp("11th" ,"School"));
  edu.insert(mp("HS-grad" ,"Graduate"));
  edu.insert(mp("Prof-school" ,"Graduate"));
  edu.insert(mp("Assoc-acdm","Graduate"));
  edu.insert(mp("Assoc-voc","Graduate"));
  edu.insert(mp("9th" ,"School"));
  edu.insert(mp("7th-8th","School"));
  edu.insert(mp("12th" ,"School"));
  edu.insert(mp("Masters","Graduate"));
  edu.insert(mp("1st-4th","School"));
  edu.insert(mp("10th" ,"School"));
  edu.insert(mp("Doctorate" ,"Graduate"));
  edu.insert(mp("5th-6th" ,"School"));
  edu.insert(mp("Preschool","School"));

  // marital

  mar.insert(mp("Married-civ-spouse" ,"spouse present"));
  mar.insert(mp("Divorced","spouse not present"));
  mar.insert(mp("Never-married", "spouse not present"));
  mar.insert(mp("Separated" ,"spouse not present"));
  mar.insert(mp("Widowed" ,"spouse not present"));
  mar.insert(mp("Married-spouse-absent" ,"spouse not present"));
  mar.insert(mp("Married-AF-spouse", "spouse present"));


  // country 


  con.insert(mp("United-States", "A*a"));
  con.insert(mp("Cambodia", "A*a"));
  con.insert(mp("England","Europe"));
  con.insert(mp("Puerto-Rico","A*a"));
  con.insert(mp("Canada","A*a"));
  con.insert(mp("Germany" ,"Europe"));
  con.insert(mp("Outlying-US(Guam-USVI-etc)" ,"A*a"));
  con.insert(mp("India" ,"A*a"));
  con.insert(mp("Japan" ,"A*a"));
  con.insert(mp("Greece","Europe"));
  con.insert(mp("South" ,"A*a"));
  con.insert(mp("China", "A*a"));
  con.insert(mp("Cuba" ,"A*a"));
  con.insert(mp("Iran" ,"A*a"));
  con.insert(mp("Honduras" ,"A*a"));
  con.insert(mp("Philippines", "A*a"));
  con.insert(mp("Italy", "Europe"));
  con.insert(mp("Poland" ,"Europe"));
  con.insert(mp("Jamaica", "A*a"));
  con.insert(mp("Vietnam" ,"A*a"));
  con.insert(mp("Mexico", "A*a"));
  con.insert(mp("Portugal", "Europe"));
  con.insert(mp("Ireland" ,"Europe"));
  con.insert(mp("France","Europe"));
  con.insert(mp("Dominican-Republic","A*a"));
  con.insert(mp("Laos" ,"A*a"));
  con.insert(mp("Ecuador" ,"A*a"));
  con.insert(mp("Taiwan", "A*a"));
  con.insert(mp("Haiti" ,"A*a"));
  con.insert(mp("Columbia" ,"A*a"));
  con.insert(mp("Hungary" ,"Europe"));
  con.insert(mp("Guatemala" ,"A*a"));
  con.insert(mp("Nicaragua", "A*a"));
  con.insert(mp("Scotland","Europe"));
  con.insert(mp("Thailand" ,"A*a"));
  con.insert(mp("Yugoslavia" ,"Europe"));
  con.insert(mp("El-Salvador","A*a"));
  con.insert(mp("Trinadad&Tobago","A*a"));
  con.insert(mp("Peru", "A*a"));
  con.insert(mp("Hong","A*a"));
  con.insert(mp("Holand-Netherlands","Europe"));

  // work

  wrk.insert(mp("Private" ,"Non-Government"));
  wrk.insert(mp("Priv-house-serv" ,"Non-Government"));
  wrk.insert(mp("Self-emp-not-inc" ,"Non-Government"));
  wrk.insert(mp("Self-emp-inc" ,"Non-Government"));
  wrk.insert(mp("Federal-gov","Government"));
  wrk.insert(mp("Local-gov","Government"));
  wrk.insert(mp("State-gov","Government"));
  wrk.insert(mp("Without-pay" ,"Unemployed"));
  wrk.insert(mp("Never-worked","Unemployed"));

  for(auto &x : wrk) {
    if(x.second == "Non-Government" || x.second == "Government") {
      x.second = "Employed";
    }
  }

  O.push_back("Craft-repair");
  O.push_back("Other-service");
  O.push_back("Sales");
  O.push_back("Exec-managerial");
  O.push_back("Prof-specialty");
  O.push_back("Handlers-cleaners");
  O.push_back("Machine-op-inspct");
  O.push_back("Adm-clerical");
  O.push_back("Farming-fishing");
  O.push_back("Transport-moving");
  O.push_back("Priv-house-servr");
  O.push_back("Protective-serv");
  O.push_back("Armed-Forces");
  O.push_back("Priv-house-serv");

}

void data() {
  for(auto x : edu){
    E.push_back(x.first);
  }
  for(auto x : wrk){
    W.push_back(x.first);
  }
  for(auto x : con){
    C.push_back(x.first);
  }
  for(auto x : mar){
    M.push_back(x.first);
  }
}
// 0-30 1 or 5
// 31-60 2 or 4
// 61 120 // 3 4 5 
int main() {
  pre();
  data();
  int age_input = -1;
  string sex_input = "" ,edu_input = "" ,work_input = "",country_input = "",race_input = "",marital_input = "";
  string occupation_input = "",salary_input = "";
  int flag = 0;
  printf("Want to enter Age in Years(1,120) \n 0. No \n 1. Yes \n");
  cin >> flag;
  if(flag){
    printf("Enter Your Age\n");
    cin >> age_input;
    for(auto x : age){
      if(age_input >= x.first.first  && age_input <= x.first.second){
	age_input = x.second;
	break;
      }
    }
  }
  flag = 0;
  printf("Want to enter Sex \n 0. No \n 1. Yes \n");
  cin >> flag;
  sex_input = "Any";
  if(flag){
    printf("Enter Your Sex (Male, Female) \n");
    string temp;
    cin >> temp;
  }
  flag = 0;
  printf("Want to enter Race \n 0. No \n 1. Yes \n");
  cin >> flag;
  sex_input = "Person";
  if(flag){
    printf("Enter Your Sex (Black, White) \n");
    string temp;
    cin >> temp;
  }
  flag = 0;
  printf("Want to enter Education \n 0. No \n 1. Yes \n");
  cin >> flag;
  if(flag){
    int cnt = 1;
    for(auto x : E){
      printf("Press %d for ",cnt++);
      cout << x << endl;
    }
    cin >> flag;
    edu_input = edu[E[flag-1]];
  }

  flag = 0;
  printf("Want to enter Marital Status \n0. No \n 1. Yes \n");
  cin >> flag;
  if(flag){
    int cnt = 1;
    for(auto x : M){
      printf("Press %d for ",cnt++);
      cout << x << endl;
    }
    cin >> flag;
    marital_input = mar[M[flag-1]];
  }

  flag = 0;
  printf("Want to enter Country \n 0. No \n 1. Yes \n");
  cin >> flag;
  if(flag){
    int cnt = 1;
    for(auto x : C){
      printf("Press %d for ",cnt++);
      cout << x << endl;
    }
    cin >> flag;
    country_input = con[C[flag-1]];
  }

  flag = 0;
  printf("Want to enter Work details \n 0. No \n 1. Yes \n");
  cin >> flag;
  if(flag){
    int cnt = 1;
    for(auto x : W){
      printf("Press %d for ",cnt++);
      cout << x << endl;
    }
    cin >> flag;
    work_input = wrk[W[flag-1]];
  }

  /* flag = 0;
     printf("Want to enter Occupation details \n 0. No \n 1. Yes \n");
     cin >> flag;
     if(flag){
     int cnt = 1;
     for(auto x : O){
     printf("Press %d for ",cnt++);
     cout << x << endl;
     }
     cin >> flag;
     occupation_input = O[flag-1];
     }*/
  flag = 0;
  printf("Want to enter Salary details \n 0. No \n 1. Yes \n");
  cin >> flag;
  if(flag){
    printf(" 1. for <= 50K \n 2. for > 50K \n");
    cin >> flag;
    if(flag == 1){
      salary_input += "<=50K";
    }
    else {
      salary_input += ">50K";
    }
  }

  string ans = "";
  ans += "SELECT * FROM l_diverse WHERE Sex=\"Any\" AND Race=\"Person\" " ;
  if(age_input != -1){
    if(age_input == 1){
      sprintf(temp," AND ( Age = %d or Age = 3) ",age_input);
    }
    if(age_input == 2){
      sprintf(temp," AND ( Age = %d or Age = 4) ",age_input);
    }
    if(age_input == 3){
      sprintf(temp," AND ( Age = %d or Age = 4 or Age = 5 ) ",age_input);
    }
    string g = temp;
    ans += g;
  }
  if(edu_input != ""){
    sprintf(temp,"AND ( Education = \"%s\" or Education = \"***\" or Education = \"Any\"  ) ",edu_input.c_str());
    string g = temp;
    ans += g;
  }
  if(marital_input != ""){
    sprintf(temp,"AND ( MaritalStatus = \"%s\" or MaritalStatus = \"Any\" ) ",marital_input.c_str());
    string g = temp;
    ans += g;
  }
  if(country_input != ""){
    sprintf(temp,"AND Country = \"%s\" ",country_input.c_str());
    string g = temp;
    ans += g;
  }
  if(work_input != ""){
    sprintf(temp,"AND WorkClass = \"%s\" ",work_input.c_str());
    string g = temp;
    ans += g;
  }
  /*	if(occupation_input != ""){
	sprintf(temp,"AND Occupation = \"%s\" ",occupation_input.c_str());
	string g = temp;
	ans += g;
	}*/
  if(salary_input != ""){
    sprintf(temp,"AND SalaryClass = \"%s\" ",salary_input.c_str());
    string g = temp;
    ans += g;
  }
  ans += " ;";
  cout << ans << endl;
}
