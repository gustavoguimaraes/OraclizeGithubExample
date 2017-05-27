var GithubWebHook = artifacts.require("./GithubWebHook.sol");
var OraclizeAPI = artifacts.require("./OraclizeAPI.sol");
var StringUtils = artifacts.require("./StringUtils.sol");

module.exports = function(deployer) {
  deployer.deploy(OraclizeAPI);
  deployer.deploy(StringUtils);
  deployer.link(StringUtils, GithubWebHook);
  deployer.deploy(GithubWebHook);
};
