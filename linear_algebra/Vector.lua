namespace "trit"{
	namespace "math"{
		namespace "linear_algebra"{
			class "vector"
			:inherits(trit.math.linear_algebra.matrix)
			{
				metamethod"_init"
				:attributes(override)
				:body(function(self, dim)
-- 					self.dim = {};
-- 					self.dim.x = 1;
-- 					self.dim.y = dim;
-- 					self:create_table();
				end);

				metamethod"__call"
				:body(function(self)
				end);
			}
		}--linear_algebra
	}--math
}--trit
