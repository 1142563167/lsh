package com.szjm.controller.system.wechat;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.szjm.controller.base.BaseController;
import com.szjm.entity.Page;
import com.szjm.service.system.wechat.wechatnews.WechatNewsManager;
import com.szjm.util.AppUtil;
import com.szjm.util.Jurisdiction;
import com.szjm.util.ObjectExcelView;
import com.szjm.util.PageData;

import spiderman.wechat.domain.param.Article;
import spiderman.wechat.domain.param.UpdateNewsSend;
import spiderman.wechat.domain.result.BaseWechatResult;
import spiderman.wechat.util.WechatInterfaceInvokeUtil;

/** 
 * 说明：微信素材之文章
 * 创建人：
 * 创建时间：2017-07-12
 */
@Controller
@RequestMapping(value="/wechatnewsitem")
public class WechatNewsItemController extends BaseController {
	
	String menuUrl = "wechatnewsitem/list.do"; //菜单地址(权限用)
	@Resource(name="wechatnewsService")
	private WechatNewsManager wechatnewsService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增WechatNews");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		//pd.put("WECHAT_NEWS_ID", this.get32UUID());	//主键
		pd.remove("NEWS_ID");
		wechatnewsService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除WechatNews");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		wechatnewsService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改WechatNews");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		wechatnewsService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表WechatNews");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = wechatnewsService.list(page);	//列出WechatNews列表
		mv.setViewName("system/wechat/wechatnewsitem/wechatnews_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**去新增页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("system/wechat/wechatnewsitem/wechatnews_edit");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	 /**去修改页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = wechatnewsService.findById(pd);	//根据ID读取
		mv.setViewName("system/wechat/wechatnewsitem/wechatnews_edit");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	 /**批量删除
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"批量删除WechatNews");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			wechatnewsService.deleteAll(ArrayDATA_IDS);
			pd.put("msg", "ok");
		}else{
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}
	
	 /**导出到excel
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"导出WechatNews到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("备注1");	//1
		titles.add("备注2");	//2
		titles.add("备注3");	//3
		titles.add("备注4");	//4
		titles.add("备注5");	//5
		titles.add("备注6");	//6
		titles.add("备注7");	//7
		titles.add("备注8");	//8
		titles.add("备注9");	//9
		titles.add("备注10");	//10
		titles.add("备注11");	//11
		titles.add("备注12");	//12
		dataMap.put("titles", titles);
		List<PageData> varOList = wechatnewsService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).get("NEWS_ID").toString());	//1
			vpd.put("var2", varOList.get(i).getString("TITLE"));	    //2
			vpd.put("var3", varOList.get(i).getString("THUMB_MEDIA_ID"));	    //3
			vpd.put("var4", varOList.get(i).getString("SHOW_COVER_PIC"));	    //4
			vpd.put("var5", varOList.get(i).getString("AUTHOR"));	    //5
			vpd.put("var6", varOList.get(i).getString("DIGEST"));	    //6
			vpd.put("var7", varOList.get(i).getString("CONTENT"));	    //7
			vpd.put("var8", varOList.get(i).getString("URL"));	    //8
			vpd.put("var9", varOList.get(i).getString("CONTENT_SOURCE_URL"));	    //9
			vpd.put("var10", varOList.get(i).getString("ORDERBY"));	    //10
			vpd.put("var11", varOList.get(i).getString("MEDIA_ID"));	    //11
			vpd.put("var12", varOList.get(i).get("ORDER_BY").toString());	//12
			varList.add(vpd);
		}
		dataMap.put("varList", varList);
		ObjectExcelView erv = new ObjectExcelView();
		mv = new ModelAndView(erv,dataMap);
		return mv;
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
	/**
	 * 更新文章
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/updateNewsItem")
	@ResponseBody
	public Object updateNewsItem()throws Exception{
		Map<String,Object> map=new HashMap<String,Object>();//返回前端内容
		PageData pd=this.getPageData();
		PageData article1=wechatnewsService.findById(pd);
		Article article=new Article();
		article.setAuthor(article1.getString("AUTHOR"));
		article.setContent(article1.getString("CONTENT"));
		article.setContent_source_url(article1.getString("CONTENT_SOURCE_URL"));
		article.setDigest(article1.getString("DIGEST"));
		article.setShow_cover_pic(article1.getString("SHOW_COVER_PIC"));
		article.setThumb_media_id(article1.getString("THUMB_MEDIA_ID"));
		article.setTitle(article1.getString("TITLE"));
		UpdateNewsSend news=new UpdateNewsSend();
		news.setMedia_id(article1.getString("MEDIA_ID"));
		news.setIndex(String.valueOf(article1.get("ORDER_BY")));
		news.setArticles(article);
		BaseWechatResult result=WechatInterfaceInvokeUtil.updatePermanentMidea(news);
		if(result.isSuccess()){
			map.put("status", "1");
		}else{
			map.put("status", "1");
		}
		return map;
	}
}