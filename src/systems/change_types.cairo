use dojo_starter_all_types::models::all_types::{UnsignedData, SignedData, LargeData, StringData, ToupleData, ArrayData};
use starknet::{ContractAddress, get_caller_address};

//fn get the large data as ana rgument adn add 1 to each of the vars and return it
fn change_large(largeData: LargeData, player: ContractAddress) -> LargeData {
    let varFelt : felt252 = largeData.felt + 1;
    let varU256 : u256 = largeData.uTwoFiveSix + 1; 

    LargeData {
        player,
        exists: true,
        felt: varFelt,
        uTwoFiveSix: varU256,
    }
}

//fn get the signed data as an argument and add 1 to each of the vars and return it
fn change_signed(signedData: SignedData, player: ContractAddress) -> SignedData {
    let varIEight : i8 = signedData.iEight + 1;
    let varISixteen : i16 = signedData.iSixteen + 1;
    let varIThirtyTwo : i32 = signedData.iThirtyTwo + 1;
    let varISixtyFour : i64 = signedData.iSixtyFour + 1;
    let varIOneTwentyEight : i128 = signedData.iOneTwentyEight + 1;

    SignedData {
        player,
        exists: true,
        iEight: varIEight,
        iSixteen: varISixteen,
        iThirtyTwo: varIThirtyTwo,
        iSixtyFour: varISixtyFour,
        iOneTwentyEight: varIOneTwentyEight,
    }
}

//fn get the unsigned data as an argument and add 1 to each of the vars and return it
fn change_unsigned(unsignedData: UnsignedData, player: ContractAddress) -> UnsignedData {
    let varUEight : u8 = unsignedData.uEight + 1;
    let varUSixteen : u16 = unsignedData.uSixteen + 1;
    let varUThirtyTwo : u32 = unsignedData.uThirtyTwo + 1;
    let varUSixtyFour : u64 = unsignedData.uSixtyFour + 1;
    let varUOneTwentyEight : u128 = unsignedData.uOneTwentyEight + 1;

    UnsignedData {
        player,
        exists: true,
        uEight: varUEight,
        uSixteen: varUSixteen,
        uThirtyTwo: varUThirtyTwo,
        uSixtyFour: varUSixtyFour,
        uOneTwentyEight: varUOneTwentyEight,
    }
}

//fn get the string data as an argument and return it
fn change_string(stringData: StringData, player: ContractAddress) -> StringData {

    let string: ByteArray = "changed";

    StringData {
        player,
        exists: true,
        byte_array: string, 
    }
}


fn change_array(arrayData: ArrayData, player: ContractAddress) -> ArrayData {

    let testArray: Array<u8> = array![6,7,8, 9, 10];
    let testArray1: Array<u32> = array![6,7,8, 9, 10];
    // let testArray2: Array<u128> = array![6,7,8, 9, 10];
    // let testArray3: Array<felt252> = array![6,7,8, 9, 10];
    // let testArray4: Array<u256> = array![6,7,8, 9, 10];

    ArrayData {
        player,
        exists: true,
        testArray: testArray,
        testArray1: testArray1,
        // testArray2: testArray2,
        // testArray3: testArray3,
        // testArray4: testArray4,
    }
}


fn change_touple(toupleData: ToupleData, player: ContractAddress) -> ToupleData {
    
    let (x_old, y_old)= toupleData.touple;
    let (x1_old, y1_old, z_old)= toupleData.touple1;
    let (x2_old, y2_old)= toupleData.touple2;

    let touple: (u8, u16) = (x_old + 1, y_old + 1);
    let touple1: (i8, i16,u64) = (x1_old + 1, y1_old - 1, z_old + 1);
    let touple2: (felt252, u256) = (x2_old + 1, y2_old + 1);

    ToupleData {
        player,
        exists: true,
        touple : touple,
        touple1: touple1,
        touple2: touple2,
    }
}

