// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;


// True params: [1234, 15533]

contract ShnorrVerifyer {
    uint256 p = 20183;
    uint256 g = 5;
    uint256 X = 4765;
    //bool b;
    //uint24 c;

    struct Prove {
        uint256 A;
        uint256 z;
    }

    function modExp(uint256 base, uint256 exponent, uint256 modulus) internal pure returns (uint256) {
        require(modulus != 0, "Modulus cannot be 0");
        
        if (modulus == 1) return 0;
        uint256 result = 1;
        base = base % modulus;
        while (exponent > 0) {
            if (exponent % 2 == 1) {
               result = (result * base) % modulus;
            }
            exponent = exponent >> 1;
            base = (base * base) % modulus;
        }
        return result;
    }

    function verify(Prove memory prove) public view returns (uint256 c){
        uint256 h = p ** 4 + g * p ** 2 + X * p + prove.A;
        bytes32 t = bytes32(h);

        c = uint256(keccak256(abi.encode(t))) % p;
        //b = false;
        //uint256 k = modExp(X, c, p);

        //b = modExp(g, prove.z, p) == (prove.A * k) % p; 
    }


    //function getA(){


    //}

    //function sendRandom() public {
    //    c = uint24(keccak256(A)) % p;
    //    return c;
    //}

    //function check(uint24 prove) public {
    //    if prove == g^prove == A * X ^ c:
    //
    //}

} 