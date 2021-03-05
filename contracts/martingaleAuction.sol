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


contract MartingaleAuction {
    
    struct item {
        address _tokenConntract;
        address _owner;
        uint _tokenId;
        uint multiples;
        uint _curentPrice;
        uint _multiplier;
        uint startPrie;
        uint freeTokens;
        uint auctionStart;
        bool _isActive;
    }
     mapping(uint=>item)public idToAuction ;// id to auction details mapping
    uint auctionCounter;
    
    function  auctiondata(uint id)public view returns(address,address ,uint,uint,uint, bool){
    item memory  itemData =idToAuction[id];
    
    return (itemData._tokenConntract,itemData._owner,itemData._tokenId,itemData._curentPrice,itemData._multiplier,itemData._isActive);
}
    
    function removeAuction(uint id) public returns(bool){
        delete idToAuction[id];
        auctionCounter--;
        
    }
    function addAuction( address tokenConntract,address owner,uint tokenId,uint freeTokens,uint  multiples ,  uint startPrice, uint multiplier,uint auctionStart,bool isActive)public{
        
    }
    
    function addEscrow()public{
       // ERC115Interface token = 
    }
     
    }
    

