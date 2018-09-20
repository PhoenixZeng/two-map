
    require 'ac'
    
    local rect		= require 'types.rect'
	local circle	= require 'types.circle'
	local region	= require 'types.region'
	local effect	= require 'types.effect'
	local fogmodifier	= require 'types.fogmodifier'
	local move		= require 'types.move'
	local unit		= require 'types.unit'
	local attribute	= require 'types.attribute'
	local hero		= require 'types.hero'
	local damage	= require 'types.damage'
	local heal		= require 'types.heal'
	local mover		= require 'types.mover'
	local follow	= require 'types.follow'
	local texttag	= require 'types.texttag'
	local lightning	= require 'types.lightning'
	local path_block	= require 'types.path_block'
	local item		= require 'types.item'
	local game		= require 'types.game'
	local shop		= require 'types.shop'
	local sound		= require 'types.sound'
	local sync		= require 'types.sync'
	local response	= require 'types.response'
	local record	= require 'types.record'
	
    
    
    --ac.lni_loader('unit')

    
	--初始化
	rect.init()
	damage.init()
	move.init()
	unit.init()
	hero.init()
	effect.init()
	mover.init()
	follow.init()
	lightning.init()
	texttag.init()
	shop.init()
	path_block.init()
	game.init()


    	--保存预设单位
    --unit.saveDefaultUnits()
    

	game.register_observer('hero move', move.update)
	game.register_observer('mover move', mover.move)
	game.register_observer('path_block', path_block.update)
	game.register_observer('follow move', follow.move)
	game.register_observer('lightning', lightning.update)
	game.register_observer('texttag', texttag.update)
	game.register_observer('mover hit', mover.hit)