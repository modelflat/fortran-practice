program task2
    integer :: array_size = 20
    integer :: i,j,k,m

    real, allocatable :: arr(:)

    integer :: x = merge(10, 5, 10 > 5)

    real, allocatable :: arr2d(:, :)

    ! ------------------------------------------------------------------------

    print *, "--------  2.1 - slices  ---------"

    allocate (arr(array_size))
    do i = 1,array_size
        arr(i) = i
    end do

    print *, "common array: ", arr
    print *, "sliced sqrt array: ", arr(floor(array_size / 4.0):)

    print *, "mask", arr > 2
    print *, "mask elements: ",  arr * merge(1, 0, arr > 2)
    print *, "mask and remove elements: ",  pack(arr, arr > 2)

    open(1, file='example2.dat')
    write(1, '(4F10.5)') arr(1:20:4)

    print *, "masking with vector indexes: ", arr((/5,10,15/))

    ! ------------------------------------------------------------------------

    print *, "--------  2.2 array builtins ---------"

    print *, "all",   all  ( arr > 2 )
    print *, "any",   any  ( arr > 2 )
    print *, "count", count( arr > 2 )
    print *, "size",  size ( arr > 2 )
    print *, "shape", shape( arr > 2 )

    print *, "lower bound",          lbound(arr)
    print *, "upper bound",          ubound(arr)
    print *, "index of max element", maxloc(arr)
    print *, "product",              product(arr)
    print *, "sum",                  sum(arr)
    print *, "scalar product",       dot_product(arr, arr)

    print *, "matrix product",       dot_product(arr, arr(1:array_size:2))

    print *, "rotate",               cshift(arr, 1)
    print *, "left or right shift",  eoshift(arr, -1)

    print *, "before reshape",       arr(1:10)
    print *, "reshape",              reshape(arr(1:10), (/2, 5/) )
    print *, "transpose",            transpose(reshape(arr(1:10), (/2, 5/) ))

    ! ------------------------------------------------------------------------

    print *, "--------  2.3 dynamically allocated ---------"
    k = 10
    m = 20

    allocate(arr2d(k, m))
    print *, "first 2d array usage"
    do i=1, k
        do j=1,m
            arr2d(i,j) = i+j
        end do
        print *, arr2d(i,:)
    end do
    deallocate(arr2d)

    k = 4
    allocate(arr2d(k, 1))
    do i=1, k
     print *, "arr2d[", i, "][1] = ", arr2d(i, 1)
    end do
    deallocate(arr2d)
end program task2