int: N;
set of int: ITEM = 1..N;

int: C1;
int: C2;
int: C3;

array[ITEM] of int: profits;
array[ITEM] of int: weights;

array[ITEM] of var 0..1: in_k1;
array[ITEM] of var 0..1: in_k2;
array[ITEM] of var 0..1: in_k3;

constraint forall(i in ITEM)(in_k1[i] + in_k2[i] + in_k3[i] <= 1);
constraint sum(i in ITEM)(weights[i] * in_k1[i]) <= C1;
constraint sum(i in ITEM)(weights[i] * in_k2[i]) <= C2;
constraint sum(i in ITEM)(weights[i] * in_k3[i]) <= C3;

solve maximize sum(i in ITEM)(profits[i] * (in_k1[i] + in_k2[i] + in_k3[i]));

output [
  "{\"in_k1\": ", show(in_k1), ", \"in_k2\": ", show(in_k2), ", \"in_k3\": ", show(in_k3), "}\n"
];
