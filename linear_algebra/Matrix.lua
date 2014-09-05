namespace "trit"{
	namespace "math"{
		namespace "linear_algebra"{
			class "matrix"{
				metamethod"_init"
				:body(function(self, dim)
					self.dim = {};
					if type(dim) == "table" then
						self.dim.x = dim.x or dim[1];
						self.dim.y = dim.y or dim[2];
					elseif type(dim) == "number" then
						self.dim.x = dim;
						self.dim.y = dim;
					end
					self:create_table();
				end);

				method "create_table"
				:body(function(self)
					self.mtx = {}
					for i = 1, self.dim.y do
						self.mtx[i] = {};
						for j = 1, self.dim.x do
							self.mtx[i][j] = 0;
						end
					end
				end);

				metamethod"__call"
				:body(function(self)
				end);

				method "get_string"
				:body(function(self)
					local str = "";
					for i = 1, self.dim.y do
						for j = 1, self.dim.x do
							str = str .. self.mtx[i][j];
							if j ~= self.dim.x then
								str = str .. "\t"
							end
						end
						if i ~= self.dim.y then
							str = str .. "\t"
						end
					end
					return str;
				end);

				method "out"
				:body(function(self,l)
					for i = 1, self.dim.y do
						local str = "";
						for j = 1, self.dim.x do
							str = str .. self.mtx[i][j];
							if j ~= self.dim.x then
								str = str .. "\t"
							end
						end
						out(l+i, str);
					end

				end);

				metamethod "__add"
				:body(function(self, a)
					if self.dim.x == a.dim.x and self.dim.y == a.dim.y then
						self.c = trit.math.linear_algebra.matrix:new(self.dim);
						for i = 1, self.dim.y do
							self.c.mtx[i] = {};
							for j = 1, self.dim.x do
								self.c.mtx[i][j] = 0;
							end
						end

						for i = 1, self.dim.y do
							for j = 1, self.dim.x do
								self.c.mtx[i][j] = self.mtx[i][j] + a.mtx[i][j];
							end
						end

						return self.c
					else
						error("matrix:__add : dimension mismatch");
					end
				end);

			}
		}--linear_algebra
	}--math
}--trit
