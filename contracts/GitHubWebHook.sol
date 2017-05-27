pragma solidity ^0.4.8;

import './OraclizeAPI.sol';
import './StringUtils.sol';

contract GithubWebHook is usingOraclize {
  using StringUtils for string;

  mapping (address => uint) public balances;
  uint private reward = 1;
  string public lastId;

  function GithubWebHook () payable {
    checkGithub();
  }

  function __callback(bytes32 myid, string result) {
      if (StringUtils.equals(lastId, result)) {
        lastId = result;
        balances[0xfe65e28d83e85e0364d80aa6aac8d18f9a570b9f] += reward;
      }
    }

  function checkGithub() {
    oraclize_query('URL', 'json(https://api.github.com/users/gustavoguimaraes/events)[0].id');
  }
}
