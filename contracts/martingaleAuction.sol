// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.8.0;

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 */
contract MartingaleAuction {
    
    struct item {
        address _tokenConntract;
        address _owner;
        uint _tokenId;
        uint _curentPrice;
        uint _multiplier;
        uint auctionStart;
        bool _isActive;
    }
    mapping (uint=>item)AuctionsData;// id to auction details mapping
    uint auctionCounter;
    
    function  auctiondata(uint id)public view returns(address,address ,uint,uint,uint)
    item itemData =auctiondata[id];
    
    return (itemData_tokenConntract,itemData._owner,itemData._tokenId,itemData._curentPrice,itemData._multiplier,itemData._isActive;);
}
    
    function removeAuction(uint Id) public returns(bool){
        delete AuctionsData[id];
        auctionCounter--;
        
    }
    function addAuction{address tokenConntract,address owner,uint tokenId,uint curentPrice, uint multiplier,uint auctionStart,bool isActive)public{
        
    }
     
    }
    
}

}
