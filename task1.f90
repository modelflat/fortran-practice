program task1

    ! 1.1 Use some constants
    integer(8) :: answer = (42)
    integer(8) :: many_answers(5)
    real(8) :: answer_double = (42.0)
    complex(8) :: answer_complex = (42.0, 42.0)

    ! Arrays for 1.3
    real(8), allocatable :: real_array(:, :)
    complex(8), allocatable :: complex_array(:)

    many_answers(:) = 42

    print '(i2)', answer
    print *, many_answers
    print *, answer_double
    print *, answer_complex

    print *, "--------------"

    ! 1.2 use some trig
    ! implicitly declared x, wow
    x = abs(sin(real(answer, 8)))
    print '(f16.12)', x
    print *, "--------------"

    ! 1.3

    allocate (real_array (4, 2))
    real_array(:,1) = 1.0
    real_array(2:3,2) = -1.0

    print *, "real_array:"
    print *, size(real_array, 1)
    print '(f10.6)', real_array

    allocate (complex_array (4))
    do i = 1, size(real_array, 1)
        complex_array(i) = complex (real_array(i, 1), real_array(i, 2))
    end do
    deallocate (real_array)

    print *, "complex_array (should correspond to fortran memory layout):"
    print '(f10.6,f10.6,"i")', complex_array
    deallocate (complex_array)

end program task1