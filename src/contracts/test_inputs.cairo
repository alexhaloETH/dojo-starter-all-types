// Define the interface with various input types
#[dojo::interface]
trait IAllInputs {
    fn test_u8(self: @TContractState, value: u8);
    fn test_u16(self: @TContractState, value: u16);
    fn test_u32(self: @TContractState, value: u32);
    fn test_u64(self: @TContractState, value: u64);
    fn test_u128(self: @TContractState, value: u128);
    fn test_felt252(self: @TContractState, value: felt252);
    fn test_u256(self: @TContractState, value: u256);
    fn test_array(self: @TContractState, array: Array<u8>);
    fn test_tuple(self: @TContractState, tuple: (u8, u16));
    fn test_string(self: @TContractState, value: ByteArray);
    fn test_signed_i8(self: @TContractState, value: i8);
    fn test_signed_i16(self: @TContractState, value: i16);
    fn test_signed_i128(self: @TContractState, value: i128);


    fn test_mix_1(self: @TContractState, value1: u8, value2: u128);
    fn test_mix_2(self: @TContractState, value1: felt252, value2: ByteArray);
    fn test_mix_3(self: @TContractState, value1: u16, value2: Array<u8>, value3: u256);
    fn test_mix_4(self: @TContractState, value1: u64, value2: (u8, u16), value3: felt252, value4: ByteArray);
    fn test_mix_5(self: @TContractState, value1: i128, value2: u16, value3: felt252, value4: i64);


    fn test_view_call(self: @TContractState, value: u8) -> u8;
    fn test_view_call_2(self: @TContractState, value: u16, value2: i64) -> (u16,i64);
    fn test_view_call_3(self: @TContractState, value: u128, value2: i64, value3: felt252) -> (u128,i64,felt252);
    fn test_view_call_4(self: @TContractState, value: u128, value2: ByteArray, value3: felt252, value4: u256) -> (u128,ByteArray,felt252,u256);
}


// Implement the contract
#[dojo::contract]
mod test_all_inputs {
    use super::IAllInputs;

    #[abi(embed_v0)]
    impl AllInputsImpl of IAllInputs<ContractState> {
        
        fn test_u8(self: @ContractState, value: u8) {
            println!("u8 value: {}", value);
        }

        fn test_u16(self: @ContractState, value: u16) {
            println!("u16 value: {}", value);
        }

        fn test_u32(self: @ContractState, value: u32) {
            println!("u32 value: {}", value);
        }

        fn test_u64(self: @ContractState, value: u64) {
            println!("u64 value: {}", value);
        }

        fn test_u128(self: @ContractState, value: u128) {
            println!("u128 value: {}", value);
        }

        fn test_felt252(self: @ContractState, value: felt252) {
            println!("felt252 value: {}", value);
        }

        fn test_u256(self: @ContractState, value: u256) {
            println!("u256 value: {}", value);
        }

        fn test_array(self: @ContractState, array: Array<u8>) {
            println!("Array value: {:?}", array);
        }

        fn test_tuple(self: @ContractState, tuple: (u8, u16)) {
            println!("Tuple value: {:?}", tuple);
        }

        fn test_string(self: @ContractState, value: ByteArray) {
            println!("String value: {}", value);
        }

        fn test_signed_i8(self: @ContractState, value: i8) {
            println!("i8 value: {}", value);
        }

        fn test_signed_i16(self: @ContractState, value: i16) {
            println!("i16 value: {}", value);
        }

        fn test_signed_i128(self: @ContractState, value: i128) {
            println!("i128 value: {}", value);
        }
        


        fn test_mix_1(self: @ContractState, value1: u8, value2: u128) {
            println!("Mix 1 - u8 value: {}, u128 value: {}", value1, value2);
        }

        fn test_mix_2(self: @ContractState, value1: felt252, value2: ByteArray) {
            println!("Mix 2 - felt252 value: {}, String value: {}", value1, value2);
        }

        fn test_mix_3(self: @ContractState, value1: u16, value2: Array<u8>, value3: u256) {
            println!("Mix 3 - u16 value: {}, Array value: {:?}, u256 value: {}", value1, value2, value3);
        }

        fn test_mix_4(self: @ContractState, value1: u64, value2: (u8, u16), value3: felt252, value4: ByteArray) {
            println!("Mix 4 - u64 value: {}, Tuple value: {:?}, felt252 value: {}, ByteArray value: {}", value1, value2, value3, value4);
        }

        fn test_mix_5(self: @ContractState, value1: i128, value2: u16, value3: felt252, value4: i64) {
            println!("Mix 5 - i8 value: {}, u16 value: {}, felt252 value: {}, i64 value: {}", value1, value2, value3, value4);
        }



        fn test_view_call(self: @ContractState, value: u8) -> u8 {
            println!("View call - u8 value: {}", value);
            value
        }

        fn test_view_call_2(self: @ContractState, value: u16, value2: i64) -> (u16,i64) {
            println!("View call 2 - u8 value: {}, i64 value: {}", value, value2);
            (value, value2)
        }

        fn test_view_call_3(self: @ContractState, value: u128, value2: i64, value3: felt252) -> (u128,i64,felt252) {
            println!("View call 3 - u128 value: {}, i64 value: {}, felt252 value: {}", value, value2, value3);
            (value, value2, value3)
        }

        fn test_view_call_4(self: @ContractState, value: u128, value2: ByteArray, value3: felt252, value4: u256) -> (u128,ByteArray,felt252,u256) {
            println!("View call 4 - u128 value: {}, String value: {}, felt252 value: {}, u256 value: {}", value, value2, value3, value4);
            (value, value2, value3, value4)
        }
    }
}
