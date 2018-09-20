ac = {}
ac.game = {}

require 'ac.utility'
require 'ac.lni'
require 'ac.point'
require 'ac.math'
--require 'ac.vector'
require 'ac.trigger'
require 'ac.event'
require 'ac.player'
require 'ac.unit'
require 'ac.selector'
require 'ac.timer'
require 'ac.buff'
require 'ac.skill'
require 'ac.template_skill'
require 'ac.resource'

require 'ac.buff.init'

ac.lni_loader('unit')

ac.table = {}

local data_table = {
    'ItemData',
}
Table = {}

for index,name in ipairs(data_table) do
    ac.lni_loader(name)
    Table[name] = ac.lni[name]
end
