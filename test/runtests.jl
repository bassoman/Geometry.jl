using Test
import Geometry

@testset "volume" begin

    solids = [
        (Geometry.Cylinder(1, 2), pi),
        (Geometry.Cone(1, [2]), 1.04720),
        (Geometry.Cube(4), 64.0),
        (Geometry.RectangularPrism(3, 5, 7), 105.0)
    ]

    for i in solids
        @test round(Geometry.volume(i[1]), digits=5) === round(i[2], digits=5)
    end

    # @test_throws MethodError foo(x, y)
end

@testset "lateralarea" begin

    solids = [
        (Geometry.Cylinder(1, 2), 6.28319),
        (Geometry.Cone(1, [2]), 4.44288),
        (Geometry.Cube(4), 64.0),
        (Geometry.RectangularPrism(3, 5, 7), 72)
    ]

    for i in solids
        @test round(Geometry.lateralarea(i[1]), digits=5) === round(i[2], digits=5)
    end

    # @test_throws MethodError foo(x, y)
end

@testset "surfacearea" begin

    solids = [
        (Geometry.Cylinder(1, 2), 12.56637),
        (Geometry.Cone(1, [2]), 7.58448),
        (Geometry.Cube(4), 6*4^2),
        (Geometry.RectangularPrism(3, 5, 7), 142.0)
    ]

    for i in solids
        @test round(Geometry.surfacearea(i[1]), digits=5) === round(i[2], digits=5)
    end

    # @test_throws MethodError foo(x, y)
end

# @testset "methods" begin
#     ms = [x.sig for x in Geometry.methods(Geometry.volume)]
#     for i in ms
#         println(i.parameters[2])
#     end
# end

# @testset "bar" begin
#     z = 4.
#     @test bar(z) == 1.
# end
