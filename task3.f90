program task3
    integer :: i,j,x,y
    real, allocatable :: arr(:,:)

    print *, "--------  3.1  ---------"
    x=3
    y=5
    allocate(arr(x, y))
    do i=1,x
        do j=1,y
            arr(i, j) = i + j
        end do
    end do

    print *, "where array > 5"
    where(arr>5) arr = -arr
    print *, arr

    arr = abs(arr)

    print *, "complex where clause"
    where (arr < 5)
        arr = 0
    elsewhere (arr == 5)
        arr = arr**2
    elsewhere (arr >5 .AND. arr<8)
        arr = arr*10
    end where
    print *, "result: ", arr

    print *, "--------  3.2  ---------"

    forall (i=1:x:1)
        forall(j=1:y:1)
            arr(i,j) = arr(i,j) + 1
        end forall
    end forall

    print *, "forall(): ", arr
end program task3

