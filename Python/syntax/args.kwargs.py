
def args_kwargs(x, y, *args, **kwargs):
    print(x)
    print(y)
    print(args)
    print(kwargs)

args_kwargs('a', 1, 'b', 2, 'c', 3, d=4, e=5)

List = ['b', 2, 'c', 3]
Dict = {'d': 4, 'e': 5}
args_kwargs('a', 1, *List, **Dict)

