using Data.EF;
using Data.EFModels;
using IMDB.Controllers;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace IMDB.ViewModels
{
    public class TVSeriesController : Controller
    {
    private readonly AppDBContext _dbContext;
    private readonly ILogger<HomeController> _logger;
    private readonly IWebHostEnvironment WebHostEnvironment;

        public TVSeriesController(AppDBContext dbContext, ILogger<HomeController> logger,
           IWebHostEnvironment webhostEnvironment)
        {
            _dbContext = dbContext;
            _logger = logger;
            WebHostEnvironment = webhostEnvironment;
        }

        public IActionResult ShowTVSeries()
        {

            var model = new ShowBroadcastCategoryVM();
            model.Page = 1;
            model.PageSize = 10;


            model.FinalResult = _dbContext.BroadcastCategories
                .Where(t=>t.BroadcastCategoryTypeID==2).OrderByDescending(t => t.AvgScore).Take(model.PageSize)
                .Select(d => new ShowBroadcastCategoryVM.Rows
                {
                    BroadcastCategoryID = d.BroadcastCategoryID,
                    BroadcastName = d.Title,
                    Description = d.Description,
                    ReleaseDate = d.ReleaseDate.ToString("dd.MM.yyyy"),
                    CoverImagePath = d.CoverImagePath,
                    Casts = _dbContext.BroadcastCategoryCasts.Where(x => x.BroadcastCategoryID == d.BroadcastCategoryID)
                .Select(x => new Cast
                {
                    CastID = x.CastID,
                    FirstName = x.Cast.FirstName,
                    LastName = x.Cast.LastName

                }).ToList(),
                    AverageReview = d.AvgScore




                }).ToList();


           
            


            model.BroadCastType = 2;
              return View("~/Views/BroadcastCategory/ShowBroadcastCategory.cshtml",model);


        }

        public IActionResult TenMoreSeries(int page)
        {
            var pageSize = 10;

            var model = new ShowBroadcastCategoryVM();
            model.Page = page;

            model.FinalResult = _dbContext.BroadcastCategories
                .Where(t => t.BroadcastCategoryTypeID == 2)
                .OrderByDescending(t => t.AvgScore).Skip((model.Page - 1) * pageSize).Take(pageSize)
                .Select(d => new ShowBroadcastCategoryVM.Rows
                {
                    BroadcastCategoryID = d.BroadcastCategoryID,
                    BroadcastName = d.Title,
                    Description = d.Description,
                    ReleaseDate = d.ReleaseDate.ToString("dd.MM.yyyy"),
                    CoverImagePath = d.CoverImagePath,
                    Casts = _dbContext.BroadcastCategoryCasts.Where(x => x.BroadcastCategoryID == d.BroadcastCategoryID)
                .Select(x => new Cast
                {
                    CastID = x.CastID,
                    FirstName = x.Cast.FirstName,
                    LastName = x.Cast.LastName

                }).ToList(),
                    AverageReview = d.AvgScore



                }).ToList();


           

           
            

            return View(model);
        }

    }
}
