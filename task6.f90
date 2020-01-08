program task6
    integer(8) :: i,j,size
    real(8), allocatable :: a(:,:)
    real(8), allocatable :: b(:)
    
    character(20) :: str

    print *, "--------  6.1  ---------"

    allocate(a(5, 4))
    a = 100.123456
    print '(f8.3)', a

    j = 3145647
    print '(i5)', j
    print '(i10)', j
    
    print *, "--------  6.2  ---------"
    
    open(1, file='task6.dat')
    write(1, '(i10)') (/(i, i=1, 10, 1)/)

    print *, "open file"
    
    rewind(1)
    size = 5
    
    rewind(1)
    inquire(1, name = str)
    print *, str
    
    allocate(b(size))
    read(1, *) b
    print *, b
    deallocate(b)
    close(1)
end program task6