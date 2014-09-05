namespace "trit"{
	namespace "math"{
		namespace "linear_algebra"{
			class "Matrix"{
				metamethod"_init"
				:body(function(self, dim)
					self.dim = dim;
				end);

				metamethod"__call"
				:body(function(self)
				end);


			}
		}--linear_algebra
	}--math
}--trit
