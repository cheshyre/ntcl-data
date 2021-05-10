! Auto-generated -- DO NOT MODIFY
module construction_package_test_module
    use :: util_api, only : &
            selector, &
            assert

    use :: storage_builder_factory_test_module, only : storage_builder_factory_test
    use :: storage_builder_test_module, only : storage_builder_test
    use :: storage_builder_interface_test_module, only : storage_builder_interface_test

    implicit none
    private

    public :: construction_package_test

    type :: construction_package_test
        type(selector) :: test_selector
    contains
        procedure :: run => run
        procedure :: cleanup => cleanup
        procedure :: clear => clear
    end type construction_package_test

    interface construction_package_test
        module procedure constructor
    end interface construction_package_test

contains
    function constructor(aselector) result(this)
        type(selector), intent(in) :: aselector
        type(construction_package_test) :: this

        call this%clear()

        this%test_selector = aselector
    end function constructor

    subroutine run(this, assertion)
        class(construction_package_test), intent(in) :: this
        type(assert), intent(inout) :: assertion

        type(storage_builder_factory_test) :: astorage_builder_factory_test
        type(storage_builder_test) :: astorage_builder_test
        type(storage_builder_interface_test) :: astorage_builder_interface_test

        call assertion%equal("construction::Package test complete", .true.)

        if ( &
                this%test_selector%is_enabled("storage_builder_factory") ) then
            astorage_builder_factory_test = storage_builder_factory_test()
            call astorage_builder_factory_test%run(assertion)
            call astorage_builder_factory_test%cleanup()
        end if

        if ( &
                this%test_selector%is_enabled("storage_builder") ) then
            astorage_builder_test = storage_builder_test()
            call astorage_builder_test%run(assertion)
            call astorage_builder_test%cleanup()
        end if

        if ( &
                this%test_selector%is_enabled("storage_builder_interface") ) then
            astorage_builder_interface_test = storage_builder_interface_test()
            call astorage_builder_interface_test%run(assertion)
            call astorage_builder_interface_test%cleanup()
        end if

    end subroutine run

    subroutine cleanup(this)
        class(construction_package_test), intent(inout) :: this

        call this%clear()
    end subroutine cleanup

    subroutine clear(this)
        class(construction_package_test), intent(inout) :: this
    end subroutine clear
end module construction_package_test_module
