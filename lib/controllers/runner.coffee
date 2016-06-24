send   = require("send")
runner = require("@cypress/core-runner")

module.exports = {
  serve: (req, res, config) ->
    res.render runner.getPathToIndex(), {
      config:      JSON.stringify(config)
      projectName: config.projectName
    }

  handle: (req, res) ->
    pathToFile = runner.getPathToDist(req.params[0])

    send(req, pathToFile)
    .pipe(res)
}
