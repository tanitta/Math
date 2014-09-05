namespace "trit"{
	namespace "math"{
		namespace "linear_algebra"{
			class "Matrix"{
				metamethod"_init"
				:body(function(self, dim)
					self.dim = {};
					if type(dim) == "table" then
						self.dim.x = dim.x;
						self.dim.y = dim.y;
					elseif type(dim) == "number" then
						self.dim.x = dim;
						self.dim.y = dim;
					end

					self.mtx = {}
					for i = 0, self.dim.y do
						self.mtx[i] = {};
						for j = 0, self.dim.x do
							self.mtx[i][j] = 0;
						end
					end
				end);

				metamethod"__call"
				:body(function(self)
				end);

				method "getString"
				:body(function(self)
					local str = "";
					for i = 0, self.dim.y do
						for j = 0, self.dim.x do
							str = str .. self.mtx[i][j];
							if j ~= self.dim.x then
								str = str .. "\t"
							end
						end
						if i ~= self.dim.y then
							str = str .. "\t"
						end
					end
				end);

			}
		}--linear_algebra
	}--math
}--trit
