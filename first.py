def print_pascals_triangle(n):
    triangle = [[0 for x in range(n)]
                 for x in range(n)]

    for line in range(0, n):
        for i in range(0, line + 1):

            if(i is 0 or i is line):
                triangle[line][i] = 1
            else:
                triangle[line][i] = (triangle[line - 1][i - 1] +
                                      triangle[line - 1][i])
            print(triangle[line][i], end=' ')

        print()

print_pascals_triangle(100)