// define the interface
#[dojo::interface]
trait IAllTypes {
    fn spawn_large(self: @TContractState);
    fn spawn_signed(self: @TContractState);
    fn spawn_unsigned(self: @TContractState);
    fn spawn_string(self: @TContractState);
    fn spawn_array(self: @TContractState);
    fn spawn_touple(self: @TContractState);
    fn emit_event(self: @TContractState);
    // fn spawn_struct(self: @TContractState);
}

//list all of the models here

//in each fucniton get the data from the world using the contract caller and then  spawn it  if not null
// dojo decorator
#[dojo::contract]
mod spawn_types {
    use super::IAllTypes;

    use starknet::{ContractAddress, get_caller_address};
    use dojo_starter_all_types::models::all_types::{UnsignedData, SignedData, LargeData, StringData, ToupleData, ArrayData,EmitEvent};

    #[abi(embed_v0)]
    impl AllTypesImpl of IAllTypes<ContractState> {
        fn spawn_large(self: @ContractState) {
            let world = self.world_dispatcher.read();
            let player = get_caller_address();

            let largeData: LargeData = get!(world, player, (LargeData));
            
            if largeData.exists{
                return;
            }

            let varFelt : felt252 = 252;
            let varU256 : u256 = 256; 

            set!
                (
                    world,
                    (
                        LargeData {
                            player,
                            exists: true,
                            felt: varFelt,
                            uTwoFiveSix: varU256,
                        },
                    )
                );
        }

        fn spawn_signed(self: @ContractState) {
            let world = self.world_dispatcher.read();
            let player = get_caller_address();

            let signedData: SignedData = get!(world, player, (SignedData));

            if signedData.exists{
                return;
            }

            set!
                (
                    world,
                    (
                        SignedData {
                            player,
                            exists: true,
                            iEight: 8,
                            iSixteen: 16,
                            iThirtyTwo: 32,
                            iSixtyFour: 64,
                            iOneTwentyEight: 128,
                        },
                    )
                );

        }

        fn spawn_unsigned(self: @ContractState) {
            let world = self.world_dispatcher.read();
            let player = get_caller_address();

            let unsignedData : UnsignedData = get!(world, player, (UnsignedData));

            if unsignedData.exists{
                return;
            }

            set!
                (
                    world,
                    (
                        UnsignedData {
                            player,
                            exists: true,
                            uEight: 8,
                            uSixteen: 16,
                            uThirtyTwo: 32,
                            uSixtyFour: 64,
                            uOneTwentyEight: 128,
                        },
                    )
                );
        }

        fn spawn_string(self: @ContractState) {
            let world = self.world_dispatcher.read();
            let player = get_caller_address();

            let stringData: StringData = get!(world, player, (StringData));

            if stringData.exists{
                return;
            }
            
            let string = "new";

            set!
                (
                    world,
                    (
                        StringData {
                            player,
                            exists: true,
                            byte_array: string
                        },
                    )
                );
        }

        fn spawn_touple(self: @ContractState) {
            let world = self.world_dispatcher.read();
            let player = get_caller_address();

            let toupleData: ToupleData = get!(world, player, (ToupleData));

            if toupleData.exists{
                return;
            }

            let touple: (u8, u16) = (8, 16);
            let touple1: (i8, i16,u64) = (8, -16, 64);
            let touple2: (felt252, u256) = (252, 256);

            set!
                (
                    world,
                    (
                        ToupleData {
                            player,
                            exists: true,
                            touple : touple,
                            touple1: touple1,
                            touple2: touple2,
                        },
                    )
                );

        }

        fn emit_event(self: @ContractState) {
            let id = 1;
            let u_thrity_two : u32 = 10;
            let u_onetwoeight : u128 = 2;

            let world = self.world_dispatcher.read();
            emit!(world, EmitEvent { id, u_thrity_two, u_onetwoeight });
        }

        fn spawn_array(self: @ContractState) {
            let world = self.world_dispatcher.read();
            let player = get_caller_address();

            let arrayData: ArrayData = get!(world, player, (ArrayData));

            if arrayData.exists{
                return;
            }
            
            let testArray: Array<u8> = array![1,2,3,4,5];
            let testArray1: Array<u32> =  array![1,2,3,4,5];
            // let testArray2: Array<u128> = array![1,2,3,4,5];
            // let testArray3: Array<felt252> =  array![1,2,3,4,5];
            // let testArray4: Array<u256> =  array![1,2,3,4,5];

            set!
                (
                    world,
                    (
                        ArrayData {
                            player,
                            exists: true,
                            testArray: testArray,
                            testArray1: testArray1
                            // testArray2: testArray2,
                            // testArray3: testArray3,
                            // testArray4: testArray4,
                        },
                    )
                );
        }
    }
}
