program task2
    integer :: n
    real, dimension(:), allocatable :: array

    read *, n
    
    array = (/ (sin(real(i)), i = 1, n) /)

    print '((a8), 16(1x, f7.4))', 'array:', array
    print '((a8), 16(1x, l7))', 'mask:', array > 0
end program task2