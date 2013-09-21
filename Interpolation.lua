namespace"trit"{
	namespace"math"{
		namespace"Interpolation"{
			class"NaturalSplineCurve"{
			    	metamethod"_init"
			    	:body(function(self, numDegree)
			    		self.numDegree = numDegree or 3
			    		self.tabData = {} 
			    		self.n = 0
			    		
			    		--係数
			    		self.coeA = {}
			    		self.coeB = {}
			    		self.coeC = {}
			    		self.coeD = {}
			    		
			    		--スプライン関数

			    	end);
			
					method"SetData"
					:body(function(self,tabInput)
						self.tabData = tabInput
						self.n = table.getn(self.tabData)
					end);
			
					method"GetCoefficient"
					:body(function(self)
					end);
			
					method"GetFunction"
					:body(function(self)
						return self.func
					end);
			
			    	metamethod"__call"
			    	:body(function(self)
				    	local h, alhpa, l, mu, z, c = {} 
				    	x = 1
				    	y = 2
				    	--1
				    	for i = 1, self.n - 1 do
				    		h[i] = self.tabData[i+1][x] - self.tabData[i][x]
				    	end
				    	
				    	for i = 1, self.n - 1 do
				    		alpha[i] = 3/h[i]*(self.tabData[i+1][y] - self.tabData[i][y]) - 3/h[i-1]*(self.tabData[i][y] - self.tabData[i-1][y])
				    	end
				    	self.func = function(l,x)
				    		out(l,x)
				    	end
			    	end);
			};
			
			--Parameter	:data = {{x1,y1},{x2,y2},...,{xn,yn}}
			--				type => "table"
			--Return	:func(x) 
			--				type => "function"
			EasySplineCurve = function(data)
				local f = trit.math.Interpolation.NaturalSplineCurve:new()
				f:SetData(data)
				f()
				return f:GetFunction()
			end
		};
	}
}