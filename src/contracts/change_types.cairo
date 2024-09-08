// define the interface
#[dojo::interface]
trait IChangeTypes {
    fn change_large(self: @TContractState);
    fn change_signed(self: @TContractState);
    fn change_unsigned(self: @TContractState);
    fn change_string(self: @TContractState);
    fn change_array(self: @TContractState);
    fn change_touple(self: @TContractState);
    // fn spawn_struct(self: @TContractState);
}

//list all of the models here




//in each fucniton get the data from the world using the contract caller and then  spawn it  if not null
// dojo decorator
#[dojo::contract]
mod change_types {
    use super::IChangeTypes;

    use starknet::{ContractAddress, get_caller_address};
    use dojo_starter_all_types::models::all_types::{UnsignedData, SignedData, LargeData, StringData, ToupleData, ArrayData};
    use dojo_starter_all_types::systems::change_types::{change_large, change_signed, change_unsigned, change_string, change_array, change_touple};

    #[abi(embed_v0)]
    impl ChangeTypesImpl of IChangeTypes<ContractState> {
        
        fn change_large(self: @ContractState) {
            let world = self.world_dispatcher.read();
            let player = get_caller_address();

            let largeData: LargeData = get!(world, player, (LargeData));
            
            if !largeData.exists{
                return;
            }

            let newData: LargeData = change_large(largeData, player);

            set!(world, (newData));
        }

        fn change_signed(self: @ContractState) {
            let world = self.world_dispatcher.read();
            let player = get_caller_address();

            let signedData: SignedData = get!(world, player, (SignedData));
            
            if !signedData.exists{
                return;
            }

            let newData: SignedData = change_signed(signedData, player);

            set!(world, (newData));
        }

        fn change_unsigned(self: @ContractState) {
            let world = self.world_dispatcher.read();
            let player = get_caller_address();

            let unsignedData: UnsignedData = get!(world, player, (UnsignedData));
            
            if !unsignedData.exists{
                return;
            }
            
            let newData: UnsignedData = change_unsigned(unsignedData, player);

            set!(world,  (newData));
        }

        fn change_string(self: @ContractState) {
            let world = self.world_dispatcher.read();
            let player = get_caller_address();

            let stringData: StringData = get!(world, player, (StringData));
            
            if !stringData.exists{
                return;
            }

            let newData: StringData = change_string(stringData, player);

            set!(world,  (newData));
        }

        fn change_array(self: @ContractState) {
            let world = self.world_dispatcher.read();
            let player = get_caller_address();

            let arrayData: ArrayData = get!(world, player, (ArrayData));
            
            if !arrayData.exists{
                return;
            }

            let newData: ArrayData = change_array(arrayData, player);

            set!(world,  (newData));
        }

        fn change_touple(self: @ContractState) {
            let world = self.world_dispatcher.read();
            let player = get_caller_address();

            let toupleData: ToupleData = get!(world, player, (ToupleData));
            
            if !toupleData.exists{
                return;
            }

            let newData: ToupleData = change_touple(toupleData, player);

            set!(world,  (newData));
        }

    }
}
