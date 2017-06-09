package com.bd.admin.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.loushang.framework.mybatis.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.bd.common.ImageCompressUtil;
import com.bd.user.data.User;
import com.bd.user.service.UserService;

@Controller
@RequestMapping(value = "/admin/user")
public class AdminUserController {
	private static final Log LOG = LogFactory.getLog(AdminUserController.class);
	@Autowired
	private UserService userService;

	/**
	 * <pre>
	 * 数据的查询
	 * 
	 * &#64;param parameters, key 分别为 ： 
	 *              <code>orderfield<code>[排序列]
	 *              <code>orderdir<code>[排序方向desc或asc] 
	 *              <code>start<code>[起始行] 
	 *              <code>limit<code>[每页显示条数]
	 * 
	 * &#64;return Map, key分别为：
	 *              <code>total<code>[总记录条数] 
	 *              <code>data<code>[商品信息列表], List 内容为 User
	 * </pre>
	 */
	@RequestMapping("/query")
	@ResponseBody
	public Map query(@RequestBody Map<String, String> parameters) {
		Map<String, Object> productData = new HashMap<String, Object>();
		List<User> list = userService.query(parameters);
		productData.put("data", list);
		// 获取总记录条数
		int total = PageUtil.getTotalCount();
		productData.put("total", total != -1 ? total : list.size());
		return productData;
	}

	/**
	 * 用户修改页面的跳转
	 * 
	 * @param id
	 *            [主键ID
	 * 
	 * @return Map key为 <code>user<code>[User对象]
	 * 
	 */
	@RequestMapping("/edit")
	public ModelAndView editPage(@RequestParam(value = "id", required = false) String id) {
		User user = null;
		if (id != null && !"".equals(id)) {
			user = userService.findOne(id);
		}
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("user", user);
		return new ModelAndView("/WEB-INF/admin/useredit", model);
	}

	@RequestMapping(value = "/save")
	@ResponseBody
	public Map<String, Object> save(HttpServletRequest request, User user) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		// 上传文件目录定义
		String path = "/upload/image/" + user.getUsername() + "/";
		if (request instanceof MultipartHttpServletRequest) {
			MultipartFile file = ((MultipartHttpServletRequest) request).getFile("headpicFile");
			if (file.getSize() > 0) {
				// 获取绝对路径
				String uploadPath = request.getSession().getServletContext().getRealPath(path);
				// 修改文件名称
				String fileName = file.getOriginalFilename();
				if (fileName.indexOf(".") >= 0) {
					int indexdot = fileName.indexOf(".");
					String suffix = fileName.substring(indexdot);
					fileName = System.currentTimeMillis() + String.valueOf((int) ((Math.random() * 9 + 1) * 100000)) + suffix;
				}
				try {
					// 创建目标文件
					File targetFile = new File(uploadPath, fileName);
					if (!targetFile.exists()) {
						targetFile.getParentFile().mkdirs();
					}
					ImageCompressUtil.saveMinPhoto(file.getInputStream(), targetFile.getAbsolutePath(), 100, 1);
					// file.transferTo(targetFile);
					String filename = request.getContextPath() + path + fileName;
					user.setHeadpic(filename);
				} catch (Exception e) {
					LOG.error("上传头像失败", e);
					resultMap.put("message", "上传头像失败");
					resultMap.put("success", false);
				}
			}
		}
		try {
			userService.save(user);
			resultMap.put("success", true);
		} catch (Exception e) {
			LOG.error("保存用户失败", e);
			resultMap.put("message", "保存用户失败");
			resultMap.put("success", false);
		}
		return resultMap;
	}

	/**
	 * 用户删除操作
	 * 
	 * @param ids
	 *            [主键ID数组]
	 * 
	 * @return 用户列表页面路径
	 * 
	 */
	@RequestMapping("/delete/{id}")
	@ResponseBody
	public Map<String, Object> delete(@PathVariable String id) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			userService.delete(id);
			resultMap.put("success", true);
		} catch (Exception e) {
			resultMap.put("message", "删除用户失败");
			resultMap.put("success", false);
		}
		return resultMap;
	}

}
