#pragma once

#include "HeliosEngine/Renderer/RenderCommand.h"
#include "HeliosEngine/Renderer/OrthographicCamera.h"
#include "HeliosEngine/Renderer/Shader.h"


namespace HeliosEngine {


	class Renderer
	{
	public:
		static void BeginScene(OrthographicCamera& camera);
		static void EndScene();

		static void Submit(const Ref<Shader>& shader, const Ref<VertexArray>& vertexArray, const glm::mat4& transform = glm::mat4(1.0f));

		inline static RendererAPI::API GetAPI() { return RendererAPI::GetAPI(); }
	private:
		struct SceneData
		{
			glm::mat4 ViewProjectionMatrix;
		};

		static Scope<SceneData> s_SceneData;
	};


} // namespace HeliosEngine
