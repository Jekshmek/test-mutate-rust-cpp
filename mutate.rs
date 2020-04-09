#[repr(C)]
pub struct ArrayWrapper {
    numbers: [u8; 6]
}

#[no_mangle]
pub extern "C" fn mutate(i: u8) -> ArrayWrapper {
    let mut numbers = ArrayWrapper{numbers: [1u8, i, 3, 4, 5, 6]};
    for (j, elem) in numbers.numbers.iter_mut().enumerate() {
        *elem += j as u8;
    }
    numbers
}
