use starknet::ContractAddress;

#[derive(Copy, Drop, Serde)]
#[dojo::model]
struct UnsignedData {
    #[key]
    player: ContractAddress,
    exists: bool,
    uEight: u8,
    uSixteen: u16,
    uThirtyTwo: u32,
    uSixtyFour: u64,
    uOneTwentyEight: u128,
}



#[derive(Copy, Drop, Serde)]
#[dojo::model]
struct SignedData {
    #[key]
    player: ContractAddress,
    exists: bool,
    iEight: i8,
    iSixteen: i16,
    iThirtyTwo: i32,
    iSixtyFour: i64,
    iOneTwentyEight: i128,
}

#[derive(Copy, Drop, Serde)]
#[dojo::model]
struct LargeData {
    #[key]
    player: ContractAddress,
    exists: bool,
    felt: felt252,
    uTwoFiveSix: u256,
}

#[derive(Drop, Serde)]
#[dojo::model]
struct StringData {
    #[key]
    player: ContractAddress,
    exists: bool,
    byte_array: ByteArray, 
}


//Invalid copy trait implementation, Trait has no implementation in context: core::traits::Copy::
#[derive( Drop, Serde)]  //traits implemented by the model, issue altoughn its in smal caps does say copy trait being the error
#[dojo::model]
struct ArrayData {
    #[key]
    player: ContractAddress,
    exists: bool,
    testArray: Array<u8>,
    testArray1: Array<u32>,
    // testArray2: Array<u128>,
    // testArray3: Array<felt252>,
    // testArray4: Array<u256>,
}

#[derive(Copy, Drop, Serde)]
#[dojo::model]
struct ToupleData {
    #[key]
    player: ContractAddress,
    exists: bool,
    touple: (u8, u16),
    touple1: (i8, i16,u64),
    touple2: (felt252, u256),
}

// #[derive(Copy, Drop, Serde)]
// #[dojo::model]
// struct PlayerQueryData {
//     #[key]
//     player: ContractAddress,
//     #[key]
//     x: u16,
//     #[key]
//     y: u16,
//     calls_amount: u16,
// }

// #[derive(Copy, Drop, Serde)]
// #[dojo::model]
// struct structData {
//     #[key]
//     player: ContractAddress,
//     exists: bool,
//     stats: Stats,
// }

#[derive(Copy, Drop, Serde, Hash, PartialEq, Introspect)]
struct Seed {
    background: u8,
    foreground: u16,
    after: u32,
}

#[derive(Copy, Drop, Serde, PartialEq, Introspect)]
enum TestingEnumValue {
    Regular: Seed,
    Custom: u8,
}

#[dojo::model]
#[derive(Drop, Serde, Copy)]
struct TestingEnum {
    #[key]
    player: ContractAddress,
    exists: bool,
    traits: TestingEnumValue
}

// #[derive(Copy, Drop, Serde, Introspect)]
// struct Stats {
//     attack: u8,
//     defense: u8,
//     speed: u8,
//     strength: u8,
// }



#[derive(Copy, Drop, Serde, PartialEq, Introspect)]
enum BlobertTrait {
    Background,
    Armour,
    Jewelry,
    Mask,
    Weapon,
}

#[dojo::model]
#[derive(Drop, Serde, Copy)]
struct ItemMap {
    #[key]
    custom: bool,
    #[key]
    blobert_trait: BlobertTrait,
    #[key]
    blobert_trait_id: u8,
    item_id: u128,
}

#[derive(Drop, Serde, Copy, Introspect)]
struct AttackHit {
    damage: u8,
    stun: u8,
    critical: bool,
}

#[derive(Drop, Serde, Copy, Introspect)]
enum AttackEffect {
    Failed,
    Stunned,
    Miss,
    Hit: AttackHit,
}

#[derive(Drop, Serde, Copy, Introspect)]
#[dojo::model]
#[dojo::event]
pub struct AttackResult {
    #[key]
    pub combatant_id: u128,
    #[key]
    pub round: u32,
    pub attack_id: u128,
    pub target: u128,
    pub effect: AttackEffect,
}

#[derive(Drop, Serde, Copy, Introspect)]
#[dojo::model]
#[dojo::event]
pub struct EmitEvent {
    #[key]
    pub id: u128,
    pub u_thrity_two: u32,
    pub u_onetwoeight: u128,
}