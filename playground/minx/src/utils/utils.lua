function G_FuncNew(obj) -- for Inheritance 
    function obj:new(o)
        o = o or {}
        setmetatable(o, self)
        self.__index = self
        return o
    end
    return obj
end

G_urutoraStyle = {
    fgColor = urutora.utils.toRGB('#788089'),
    bgColor = urutora.utils.toRGB('#efefef'),
    hoverbgColor = urutora.utils.toRGB('#e3e3ef'),
    hoverfgColor = urutora.utils.toRGB('#148ee3'),
    disablefgColor = urutora.utils.toRGB('#ffffff'),
    disablebgColor = urutora.utils.toRGB('#cccccc'),
    outlineColor = urutora.utils.toRGB('#aaaaaa')
}
