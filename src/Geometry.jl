module Geometry
export volume, surfacearea, lateralarea

abstract type Solid end

# *******************************************
mutable struct Cone <: Solid
    height::Float32
    # one element implies start from one point
    # two elements for truncated cone volume
    radii::Array{Float32, 1}
    function Cone(depth, diameters)
        if length(diameters) > 2
            error("Too many diameter arguments in list")
        end
        if length(diameters) == 1
            push!(diameters,0.0)
        end
        new(depth, diameters / 2)
    end
end
mutable struct Cylinder <: Solid
    height::Float32
    radius::Float32
    function Cylinder(depth, diameter)
        new(depth, (diameter / 2.0))
    end
end
struct Cube <: Solid
    side::Float32
end
struct RectangularPrism <: Solid
    height::Float32
    width::Float32
    depth::Float32
end



function volume(c::Solid)
    tc = typeof(c)
    if tc == Cone
        rads = (c.radii[1]^2 + c.radii[1]*c.radii[2] + c.radii[2]^2)
        return (1/3)*(pi*rads*c.height)
    elseif tc == Cylinder
        return (1/1)*(pi*(c.radius^2)*c.height)
    elseif tc == Cube
        return (1/1)*(c.side^3)
    elseif tc == RectangularPrism
        return (1/1) * (c.height * c.width * c.depth)
    end
    return nothing
end

function lateralarea(c::Solid)
    tc = typeof(c)
    if tc == Cone
        return pi * (c.radii[1] + c.radii[2]) * (((c.radii[1] - c.radii[2])^2 + c.height^2)^(1/2))
    elseif tc == Cylinder
        return 2*pi*c.radius*c.height
    elseif tc == Cube
        return (1/1)*4*(c.side^2)
    elseif tc == RectangularPrism
        return (1/1) * (2 * (c.height * c.width) + 2 * (c.height * c.depth))
    end
    return nothing
end
    
function surfacearea(c::Solid)
    tc = typeof(c)
    if tc == Cone
        return lateralarea(c) + pi * (c.radii[1]^2 + c.radii[2]^2)
    elseif tc == Cylinder
        return lateralarea(c) + 2*pi*(c.radius^2)    
    elseif tc == Cube
        return (1/1)*6*(c.side^2)    
    elseif tc == RectangularPrism
        return lateralarea(c) + (1/1) * (2 * (c.width * c.depth))    
    end
    return nothing
    
end

end