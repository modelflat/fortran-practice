program task4
    integer :: i, goto_idx

    real(8), allocatable :: a(:)
    integer(8), allocatable :: int_arr(:)

    print *, "--------  4.1  ---------"

    a = (/(mod(i,2), i=1,10, 1)/)
    print *, a

    do i=1,10
        if (a(i) > 0) then
            a(i) = a(i) + 1
        else if (a(i)==0) then
            a(i) = a(i) - 1
        else
            a(i) = -42
        end if
    end do

    print *, "IF statement: ", a

    int_arr = (/(int(mod(i,2)), i=1,5, 1)/)
    do i=1,size(int_arr)
        select case(int_arr(i))
            case(1:)
                int_arr(i) = +1
            case(:-1)
                int_arr(i) = -1
            case default
                int_arr(i) = 0
        end select
    end do

    print *, "SELECT CASE: ", int_arr


    print *, "--------  4.2  ---------"

    goto_idx = 0

    10 continue
    print *, goto_idx
    goto_idx = goto_idx + 1

    if (goto_idx < 5) then
        go to 10
    else
        print *, goto_idx, " <- goto_idx == 5"
    end if

    print *, "exit loop at 5"
    do i = 1,20
        print *, i
        if (i < 5) then
            cycle
        else
            print *, " bye !"
            exit
        end if
        print *, "this won't be printed"
    end do

end program task4