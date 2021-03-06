// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.8.0;

interface IERC1155 /* is ERC165 */ {
   
    event TransferSingle(address indexed _operator, address indexed _from, address indexed _to, uint256 _id, uint256 _value);

    event TransferBatch(address indexed _operator, address indexed _from, address indexed _to, uint256[] _ids, uint256[] _values);

    event ApprovalForAll(address indexed _owner, address indexed _operator, bool _approved);

    event URI(string _value, uint256 indexed _id);

    function safeTransferFrom(address _from, address _to, uint256 _id, uint256 _value, bytes calldata _data) external;

    function safeBatchTransferFrom(address _from, address _to, uint256[] calldata _ids, uint256[] calldata _values, bytes calldata _data) external;

    function balanceOf(address _owner, uint256 _id) external view returns (uint256);
    
    function balanceOfBatch(address[] calldata _owners, uint256[] calldata _ids) external view returns (uint256[] memory);     
    function setApprovalForAll(address _operator, bool _approved) external;
}


/*Safe MathLibrary  for mathematical operations*/
library SafeMath {

    /**
    * @dev Multiplies two numbers, throws on overflow.
    */
    function mul(uint256 a, uint256 b) internal pure returns (uint256 c) {
        // Gas optimization: this is cheaper than asserting 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
        if (a == 0) {
            return 0;
        }

        c = a * b;
        assert(c / a == b);
        return c;
    }

    /**
    * @dev Integer division of two numbers, truncating the quotient.
    */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        // assert(b > 0); // Solidity automatically throws when dividing by 0
        // uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold
        return a / b;
    }

    /**
    * @dev Subtracts two numbers, throws on overflow (i.e. if subtrahend is greater than minuend).
    */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b <= a);
        return a - b;
    }

    /**
    * @dev Adds two numbers, throws on overflow.
    */
    function add(uint256 a, uint256 b) internal pure returns (uint256 c) {
        c = a + b;
        assert(c >= a);
        return c;
    }
}

contract MartingaleAuction {
    
    struct Item {
        address _tokenConntract;
        address _owner;
        uint _tokenId;
        uint _multiples;
        uint _curentPrice;
        uint _multiplier;
        uint _startPrie;
        uint _freeTokens;
        uint _balanceTokens;
        uint _auctionStart;
        bool _isActive;
    }
     mapping(uint=>Item)public idToAuction ;// id to auction details mapping
    uint auctionCounter;
    
    function  auctiondata(uint id)public view returns(address,address,uint,uint,uint,uint,uint,uint,uint,uint,uint, bool){
    Item memory  itemData =idToAuction[id];
    
    return (itemData._tokenConntract,itemData._owner,itemData._tokenId,itemData._multiples, itemData._curentPrice,itemData._multiplier,itemData._startPrie,itemData._freeTokens, itemData._balanceTokens,itemData._auctionStart, itemData._isActive);
}
    
    function removeAuction(uint id) public returns(bool){
        delete idToAuction[id];
        auctionCounter--;
        
    }
    function addAuction( address tokenConntract,address owner,uint tokenId,uint freeTokens,uint  multiples ,  uint startPrice, uint multiplier,uint duration)public{
        
    }
    
    function addEscrow(address tokenConntract)public{
     IERC1155 token = IERC1155(tokenConntract);
    
     
   //  token.safeTransferFrom()
    }
    function bid(uint id, uint amount)public{
        require (amount==msg.value, "amount mismatch");
         Item memory itemData = idToAuction[id];
         require(itemData._curentPrice==amount,"amount less than current price");
       
        
    }
    function updateAuction(uint id )internal{
        uint  newprice=0;
         Item memory itemData= idToAuction[id];
           uint currenttoken = itemData._multiples - itemData._balanceTokens;
           if(currenttoken<itemData._freeTokens){
              // newprice=0;//do nothing already zero
           
         }else{
         newprice=itemData._curentPrice *itemData._multiplier;
         }
         idToAuction[id]._curentPrice=newprice;
         idToAuction[id]._balanceTokens=idToAuction[id]._balanceTokens.sub(1);
         
         
         
    }
    
}
     
    
    

